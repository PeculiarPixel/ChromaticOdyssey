class CustomMenu 
{
  private ArrayList<ArbitraryButton> buttons;
  private ArrayList<CustomDisplay> displays;
   
  public CustomMenu(ArrayList<ArbitraryButton> buttons, ArrayList<CustomDisplay> displays)
  {
    this.buttons = buttons;
    this.displays = displays;
  }
  
  public CustomMenu(ArrayList<ArbitraryButton> buttons)
  {
    this(buttons, new ArrayList<CustomDisplay>());
  }
  
  public CustomMenu()
  {
    this(new ArrayList<ArbitraryButton>(), new ArrayList<CustomDisplay>());
  }
  
  public void drawMenu(Graphics2D g2d)
  {
    if(displays != null)
      drawDisplays(g2d);
    if(buttons != null)
      drawButtons(g2d);
  }
  
  public void drawButtons(Graphics2D g2d)
  {
    for (ArbitraryButton button : buttons)
      button.drawActive(g2d);
  }
  
  public void drawDisplays(Graphics2D g2d)
  {
    for (CustomDisplay display : displays)
      display.drawImage(g2d);
  }
  
  public void updateDisplays()
  {
    for(int i = 0; i < displays.size(); i++)
      displays.get(i).update();
  }
  
  public void checkForHover()
  {
    Point point = new Point(mouseX, mouseY);

    for (ArbitraryButton button : buttons)
      button.checkHover(point);
  }
  
  public void checkForPress(Graphics2D g2d)
  {
    Point point = new Point(mouseX, mouseY);
    
    for (ArbitraryButton button : buttons)
    {
      if (button.pointIsOn(point))
      {
        button.press();
        return;
      }
      
      else
        button.drawBase(g2d);
    }
  }
  
  public void changeButtons(ArrayList<ArbitraryButton> oldButtons, ArrayList<ArbitraryButton> newButtons)
  {
    buttons.removeAll(oldButtons);
    buttons.addAll(newButtons);
  }
}

class BaseCombatMenu extends CustomMenu
{
  private static final int ATTACK = 1;
  private static final int ITEM = 2;
  private static final int COLOR = 3;
  
  public BaseCombatMenu(FightManager manager)
  {
    super();
    // Construct base (menu selection) buttons:
      
    Combatant player = manager.getPlayer();
    Combatant enemy = manager.getEnemy();
    
    // Construct base displays (spriteFrames and nameFrames):
    ArrayList<CustomDisplay> baseDisplays = new ArrayList<CustomDisplay>();
    baseDisplays.add(new BackgroundDisplay());
    baseDisplays.add(new SpriteFrame(new Point(128, 128), player));
    baseDisplays.add(new SpriteFrame(new Point(640, 128), enemy));
    baseDisplays.add(new NameFrame(new Point(128, 0), player));
    baseDisplays.add(new NameFrame(new Point(640, 0), enemy));
    
    super.buttons.addAll(manager.getBaseButtons());
    super.displays.addAll(baseDisplays);
   }
}

class ColorCombatMenu extends CustomMenu
{
  private static final int ATTACK = 1;
  
  public ColorCombatMenu(FightManager manager)
  {
    super();
    ArrayList<ArbitraryButton> colorButtons = new ArrayList<ArbitraryButton>();
    CombatColor[] newtColors = manager.getNewtColors();
   
    super.buttons.addAll(manager.getBaseButtons());
   
    // Build and add color selection buttons:
    colorButtons.add(new ColorButton(manager, newtColors[0], new Point(128, 256)));
    colorButtons.add(new ColorButton(manager, newtColors[1], new Point(640, 256)));
    colorButtons.add(new ColorButton(manager, newtColors[2], new Point(384, 256)));
    super.buttons.addAll(colorButtons);
  }
}

class AttackCombatMenu extends CustomMenu
{
  //FightManager manager;
  
  public AttackCombatMenu(FightManager manager)
  {
    super();
    //this.manager = manager;
    super.buttons.addAll(manager.getBaseButtons());
  }
  
}

class ItemCombatMenu extends CustomMenu
{
  public ItemCombatMenu(FightManager manager)
  {
    super();
    ArrayList<ArbitraryButton> itemButtons = new ArrayList<ArbitraryButton>();
   
    itemButtons.addAll(manager.getBaseButtons());
   
    int[] inventory = manager.getInventory();
    
    Combatant player = manager.getPlayer();
    
    HealingPotion potion = new HealingPotion(inventory[0], 100, player);
    HealingPotion megaPotion = new HealingPotion(inventory[1], 999, player);
    // cureBerry
    MeterBooster prismDust = new MeterBooster(inventory[3], 3, player);
    // curseDust
    MeterBooster prismShard = new MeterBooster(inventory[5], 5, player);
    
    
    
   
    // Ideally these button initializations would be handled by an Inventory management object
      
    itemButtons.add(new ItemButton(new Point(512, 0), "Potion", manager, 0, potion));
    itemButtons.add(new ItemButton(new Point(512, 128), "Mega Potion", manager, 1, megaPotion));
    //itemButtons.add(new ItemButton(new Point(512, 256), "Cure Berry", manager));
    itemButtons.add(new ItemButton(new Point(768, 0), "Prism Dust", manager, 3, prismDust));
    //itemButtons.add(new ItemButton(new Point(768, 128), "Curse Dust", manager));
    itemButtons.add(new ItemButton(new Point(768, 256), "Prism Shard", manager, 5, prismShard));
   
    super.buttons = itemButtons;
  }
}
  
class EndGameMenu extends CustomMenu
{
  public EndGameMenu(FightManager manager)
  {
    super();
    
    
  }
}