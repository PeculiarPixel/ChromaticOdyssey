class ArbitraryButton 
{
  private BufferedImage baseGraphic;
  private BufferedImage hoverGraphic;
  
  private ArrayList<ArbitraryFunction> function;
  
  private Point origin;
  private int[] bounds;
  
  private boolean hover;
  
  private static final int MINX = 0;
  private static final int MAXX = 1;
  private static final int MINY = 2;
  private static final int MAXY = 3;
  
  public ArbitraryButton(BufferedImage baseGraphic, BufferedImage hoverGraphic, Point origin, int width, int height, ArbitraryFunction func)
   {  
    this.baseGraphic = baseGraphic;
    this.hoverGraphic = hoverGraphic;
    function = new ArrayList<ArbitraryFunction>();
    function.add(func);
    this.origin = origin;
    
    hover = false;
    
    bounds = new int[4];
    bounds[MINX] = origin.x;
    bounds[MINY] = origin.y;
    bounds[MAXX] = origin.x + width;
    bounds[MAXY] = origin.y + height;
   }
   
  public ArbitraryButton(BufferedImage baseGraphic, BufferedImage hoverGraphic, Point origin, int width, int height)
  {
    this(baseGraphic, hoverGraphic, origin, width, height, null);
  }
  
  public void press()
  {
    //print("Press detected");
    for(ArbitraryFunction func : function)
    {
      func.execute();
    }
  }
  
  public void setHover(boolean hover)
  {
    this.hover = hover;
  }
  
  public void setBaseImage(BufferedImage base)
  {
    baseGraphic = base;
  }
  
  public void setHoverImage(BufferedImage hover)
  {
    hoverGraphic = hover;
  }
  
  public void drawActive(Graphics2D g2d)
  {
    if (hover) drawHover(g2d);
    else drawBase(g2d);
  }
  
  public void drawBase(Graphics2D g2d)
  {
    g2d.drawImage(baseGraphic, null, origin.x, origin.y);
  }
  
  public void drawHover(Graphics2D g2d)
  {
    g2d.drawImage(hoverGraphic, null, origin.x, origin.y);
  }
  
  public BufferedImage getBase()
  {
    return baseGraphic;  
  }
  
  public BufferedImage getHover()
  {
    return hoverGraphic;
  }
  
  public void checkHover(Point point)
  {
    hover = pointIsOn(point);
  }
  
  public void addFunction(ArbitraryFunction newFunction)
  {
    function.add(newFunction);
  }
  
  public void removeFunction(ArbitraryFunction oldFunction)
  {
    function.remove(oldFunction);
  }
  
  public void setFunction(ArrayList<ArbitraryFunction> function)
  {
    this.function = function;
  }
  
  public boolean pointIsOn(Point point)
  { 
    if (point.x >= bounds[MAXX] || point.x <= bounds[MINX]) return false;
    if (point.y >= bounds[MAXY] || point.y <= bounds[MINY]) return false;
    return true;
  }
  
}



class MenuButton extends ArbitraryButton
{
  private static final int WIDTH = 512;
  private static final int HEIGHT = 128;
  
  private FightManager manager;
  private int index;
  
  public MenuButton(FightManager manager, int index, String string, Point strPt, Point origin)
  {
    super(null, null, origin, WIDTH, HEIGHT);
    
    this.manager = manager;
    this.index = index;
    
    Font buttonFont = new Font("TimesRoman", Font.BOLD, 36);
    Point sizePoint = new Point(WIDTH, HEIGHT);
    super.setBaseImage(imageMaker.drawBaseRectImage(sizePoint, buttonFont, strPt, string));
    super.setHoverImage(imageMaker.drawHoverRectImage(sizePoint, buttonFont, strPt, string));
  }
  
  public void press()
  {
    manager.setActive(index);
  }
}

public class ExitButton extends MenuButton
{
  public ExitButton(FightManager manager, String string, Point strPt, Point origin)
  {
    super(manager, -1, string, strPt, origin);
  }
  
  public void press()
  {
    System.exit(0);
  }
}



class ColorButton extends ArbitraryButton
{
  // To-do: clean this up so it gets attack and base menus straight from manager
  // (i.e., button shouldn't need to know menu indices...)
  private static final int DIAMETER = 128;
  private FightManager manager;
  private CombatColor combatColor;
  private CustomMenu attackMenu;
  private Combatant player;
  
  public ColorButton(FightManager manager, CombatColor combatColor, Point origin)
  {
    // Note: modify this so it gets data from manager rather than needing individual parameters
    super(null, null, origin, DIAMETER, DIAMETER);
    this.manager = manager;
    this.combatColor = combatColor;
    attackMenu = manager.getMenu(1);
    player = manager.getPlayer();
    //super.setBaseImage(imageMaker.drawBaseCircImage(DIAMETER, combatColor.getColor()));
    String colorString = "";
    if(combatColor.getColor() == Color.RED)
    {
      colorString = "RED";
    }
    else if(combatColor.getColor() == Color.BLUE)
    {
      colorString = "BLUE";
    }
    else if(combatColor.getColor() == Color.YELLOW)
    {
      colorString = "YELLOW";
    }
    try
    {
    String basePath = ("/SpriteAnimations/Combat/ColorSelector-" + colorString + ".png");
    println("Basepath = " + basePath);
    BufferedImage base = ImageIO.read(new File(dataPath(basePath)));
    super.setBaseImage(base);
    //super.setHoverImage(imageMaker.drawHoverCircImage(DIAMETER, combatColor.getColor()));
    BufferedImage hover = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/AltColorSelector-" + colorString +".png")));
    super.setHoverImage(hover);
    }
    catch(IOException e){println("Couldnt load colorselectors");}
    
  }
  
  public void press()
  {
    super.setHover(false);
    attackMenu.changeButtons(player.getActiveColor().getButtons(), combatColor.getMeteredButtons());
    player.changeColor(combatColor);
    manager.setActive(0);
  }
  
  public boolean pointIsOn(Point point)
  {
    // Circle detection
    int radius = DIAMETER/2;
    int centerX = super.origin.x + radius;
    int centerY = super.origin.y + radius;
    float dX = centerX - point.x;
    float dY = centerY - point.y;
    return (sqrt(sq(dX) + sq(dY)) < radius);
  }
  
}



class MoveButton extends ArbitraryButton
{
  private static final int WIDTH = 256;
  private static final int HEIGHT = 128;
  private final Point sizePt = new Point(WIDTH, HEIGHT); 
  private final Point strPt = new Point(WIDTH/2, HEIGHT/2);
   
  private FightManager manager;
  private CombatMove attack;
  
  public MoveButton(Point origin, String string, FightManager manager, CombatMove attack)
  {
    super(null, null, origin, WIDTH, HEIGHT);
    
    this.manager = manager;
    this.attack = attack;
    
    Font font = new Font("TimesRoman", Font.BOLD, 18);
    super.setBaseImage(imageMaker.drawBaseRectImage(sizePt, font, strPt, string));
    super.setHoverImage(imageMaker.drawHoverRectImage(sizePt, font, strPt, string));
  }
  
  public void press()
  {
    super.setHover(false);
    manager.processTurn(attack);
    manager.updateAttackMenuButtons(); // Note: move this to attack menu subclass somehow
  }
}



class ItemButton extends MoveButton
{
  private CombatItem item;
  private int[] inventory;
  private int itemIndex;
  
  public ItemButton(Point origin, String string, FightManager manager, int itemIndex, CombatItem item)
  {
    super(origin, string, manager, null);
    inventory = manager.getInventory();
    this.itemIndex = itemIndex;
    this.item = item;
  }
  
  public void press()
  {
    if(inventory[itemIndex] > 0)
    {
      inventory[itemIndex]--;
      super.setHover(false);
      super.manager.processTurn(item);
    }
  }
  
  
}