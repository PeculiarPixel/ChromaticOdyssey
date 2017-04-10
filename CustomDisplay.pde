public class CustomDisplay 
{
  private BufferedImage img;
  private Point origin;
  
  private ArbitraryFunction updateFunction;
  
  public CustomDisplay(BufferedImage img, Point origin, ArbitraryFunction updateFunction)
  {
    this.img = img;
    this.origin = origin;
    this.updateFunction = updateFunction;
  }
  
  public CustomDisplay(BufferedImage img, Point origin)
  {
    this(img, origin, new EmptyFunction());
  }
  
  public void update()
  {
    updateFunction.execute();
  }
  
  public void setFunction(ArbitraryFunction function)
  {
    updateFunction = function;
  }
  
  public void setImg(BufferedImage img)
  {
    this.img = img;
  }
  
  public BufferedImage getImage()
  {
    return img;
  } 
  
  public void drawImage(Graphics2D g2d)
  {
    g2d.drawImage(img, null, origin.x, origin.y);
  }
}

public class SpriteFrame extends CustomDisplay
{
  private Combatant combatant;
  
  public SpriteFrame(Point origin, Combatant combatant)
  {
    super(imageMaker.constructSpriteFrameImage(), origin);
    this.combatant = combatant;
    combatant.setSpriteFrame(this);
  }
  
  public void drawImage(Graphics2D g2d)
  {
    update();
    g2d.drawImage(super.img, null, super.origin.x, super.origin.y);
  }
  
  public void update()
  {
    setImg(combatant.getCurrentSprite());
  }
}

public class NameFrame extends CustomDisplay
{
  private Combatant combatant;
  private BufferedImage baseFrame;
  private BufferedImage baseImage;
  private Graphics2D g2d;
  private Color[] colors;
  
  private BufferedImage redSelector;
  private BufferedImage blueSelector;
  private BufferedImage yellowSelector;
  private BufferedImage blackSelector;
  
  public NameFrame(Point origin, Combatant combatant)
  {
    super(new BufferedImage(294, 187, BufferedImage.TYPE_INT_ARGB), origin);
    this.combatant = combatant;
    combatant.setNameFrame(this);
    baseImage = super.img;
    try
    {
    baseFrame = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/Combat-UI-screen.png")));
    redSelector = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/ColorSelector-RED.png")));
    blueSelector = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/ColorSelector-BLUE.png")));
    yellowSelector = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/ColorSelector-YELLOW.png")));
    blackSelector = ImageIO.read(new File(dataPath("/SpriteAnimations/Combat/ColorSelector-BLACK.png")));
    }
    catch(IOException exception){println("Unable to open Combat UI nameframe file");}
    g2d = (Graphics2D) baseImage.createGraphics();
    
    g2d.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON );
    
    /*
    Graphics2D g2 = (Graphics2D) baseFrame.createGraphics();
    g2.drawImage(baseImage, 0, 0, null);
    g2.dispose();
    */
    g2d.drawImage(baseFrame, 0, 0, null);
    colors = new Color[3];
    colors[0] = Color.RED;
    colors[1] = Color.BLUE;
    colors[2] = Color.YELLOW;
  }
  
  public void update()
  {
    //g2d.setBackground(new Color(0, 0, 0, 0));
    //g2d.clearRect(0, 0, 256, 128);
    
    
    g2d.drawImage(baseFrame, 0, 0, null);
    
    g2d.setColor(Color.BLACK);
    g2d.drawString(combatant.getName(), 70, 50);
    
    int[] stats = combatant.getStats();
    g2d.drawString(combatant.getHPString(), 80, 80);
    g2d.drawString("" + stats[0], 85, 110);
    g2d.drawString("" + stats[1], 85, 138);
    g2d.drawString("" + stats[2], 85, 165);
      
    for(int i = 0; i < 3; i++)
    {
      int y = (i * 21) + 120;
      int meter = combatant.getMeter(i);
      for(int j = 0; j < 5; j++)
      {
         int x = (j * 26) + 129;
         
         if (j < meter)
         {
           g2d.setColor(colors[i]);
           g2d.fillRect(x, y, 20, 20);
         }
         
         g2d.setColor(Color.GRAY);
         g2d.drawRect(x, y, 20, 20);
      }
      
    }

    Color activeColor = combatant.getActiveColor().getColor();
    BufferedImage selector = null;
    if(activeColor == Color.RED)
    {
      selector = redSelector;
    }
    else if (activeColor == Color.BLUE)
    {
      selector = blueSelector;
    }
    else if (activeColor == Color.YELLOW)
    {
      selector = yellowSelector;
    }
    else if (activeColor == Color.BLACK)
    {
      selector = blackSelector;
    }
    g2d.scale(0.5, 0.5);
     
    g2d.drawImage(selector, 300, 32, null);
    g2d.scale(2, 2);
  }
  
}

class FireballDisplay extends CustomDisplay
{
  private Graphics2D g2;
  private int x;
  private int y = 334; 
  private int speed = 8;
  private int xInitial = 256;
  private int xTerminal = 640;
  private boolean suspended;
  private BufferedImage activeFireball;
  private BufferedImage enemyFireball;  
  private int frameStartTime = 0;
  
  private FightManager manager;
  
  private javax.swing.Timer timer;
  
  
  public FireballDisplay(FightManager manager, int xInitial, int xTerminal)
  {
    super(new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB), new Point(0, 0));
    g2 = super.img.createGraphics();
    this.xInitial = xInitial;
    this.xTerminal = xTerminal;
    x = xInitial;
    suspended = true;
    this.manager = manager;
    
    timer = new javax.swing.Timer(17, new ActionListener()
    {
      public void actionPerformed(ActionEvent evt)
      {
        timer.stop();
        
        //println("Updating from timer:");
        
        update();       
        
        if(!suspended)
        {
          //println("Suspended false, restarting timer");                     
          lockMouseInput = false;

          timer.restart();
        }
        
      }
    });
        
  }
  
  public void update()
  {
    //println("Updating fireball display");
      if(!suspended)
      {
        
         //if(millis() - frameStartTime >= 17)
         //{
           //println("Incrementing fireball frame");
           frameStartTime = millis();
           x += speed;
           //g2.clearRect(0, 0, 1024, 768);
           super.setImg(new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB));
           g2 = super.img.createGraphics();
           g2.scale(2, 2);
           g2.drawImage(activeFireball, x/2, y/2, null);
           //image(pActiveFireball, x, y);
         //}
         // Clear base image
         // Draw activeFireball at (x, y)
         
         if(x >= xTerminal)
         {
           // Time to start drawing opponent's fireball:
           super.setImg(new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB));
           g2 = super.img.createGraphics();
           activeFireball = blackFireball;
           //println("Suspending fireball animation");
           //suspended = true;
           // Clear base image
           //g2.clearRect(0, 0, 1024, 768);
           frameStartTime = 0;
           speed = -speed;
         }
         
         if(x <= xInitial - 1)
         {
           super.setImg(new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB));
           g2 = super.img.createGraphics();
           suspended = true;
           frameStartTime = 0;
           speed = -speed;
         }
         
      }
  }
  
  public void triggerFireball(BufferedImage activeFireball, BufferedImage enemyFireball)
  {
    println("Triggering fireballdisplay");
    // Check if user == enemy, flip accordingly if necessary
    this.activeFireball = activeFireball;
    this.suspended = false;
    x = xInitial;
    timer.start();
    //lockMouseInput = true;
    //manager.untriggerFireball();
  }
  
  
}

class BackgroundDisplay extends CustomDisplay
{
  private Graphics2D g;
  private BufferedImage image1;
  private BufferedImage image2;
  private javax.swing.Timer timer;
  private int y1;
  private int y2;
  private int speed;
  
  public BackgroundDisplay()
  {
    super(new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB), new Point(0, 0));
    BackgroundInterpolator interpolator = new BackgroundInterpolator();
    //super.img = interpolator.getImage();
    image1 = interpolator.getImage();
    image2 = interpolator.getAltImage();
    
    speed = 3;
    y1 = 0;
    y2 = y1 - 768;
    
    g = (Graphics2D) super.img.createGraphics();
    g.drawImage(image1, 0, 0, null);
      
    timer = new javax.swing.Timer(17, new ActionListener()
    {
      public void actionPerformed(ActionEvent evt)
      {
        timer.stop();
        
        update();
        
        timer.restart();
      }
    });
    
    timer.start();
  }
  
  public void update()
  {
    g.drawImage(image1, 0, y1, null);
    g.drawImage(image2, 0, y2, null);
        
    y1 = incrementWithBound(y1);
    y2 = incrementWithBound(y2);
  }
  
  public int incrementWithBound(int y)
  {
    y += speed;
    
    if (y >= 768) 
      y = -768;
    
    return y;
  }
}