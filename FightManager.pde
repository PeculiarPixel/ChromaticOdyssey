class FightManager
{  
  private CustomMenu activeMenu;
  private ArrayList<CustomMenu> menus;
  private BufferedImage img;
  private Graphics2D g2d;
  
  private ArrayList<ArbitraryButton> baseButtons;
  
  private Combatant player;
  private Combatant enemy;
  
  private int[] inventory;
  
  private static final int BASE = 0;
  
  private static final int ATTACK = 0;
  private static final int ITEM = 2;
  private static final int COLOR = 3;
  private static final int END = 4;
  
  private Random rand;
  
  private boolean fireballTriggered;
  
  private BaseCombatMenu  baseMenu;
  private AttackCombatMenu attackMenu;
  
  CombatColor[] newtColors;
  CombatColor colorBad;
  
  public FightManager(Combatant player, Combatant enemy, int[] inventory)
  {
   this.player = player;
   this.enemy = enemy;
   this.inventory = inventory;
   
   rand = new Random();
      
   menus = new ArrayList<CustomMenu>();
   
   img = new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB);
   g2d = (Graphics2D) img.createGraphics();
   
   initializeMoves();
   initializeMenus();
   
   enemy.changeColor(colorBad);
   
   activeMenu = menus.get(BASE);
   activeMenu.updateDisplays();
   
   fireballTriggered = false;
  }
  
  // =====================================
  
  // Initialization of moves, characters, menus:
  
  private ArrayList<ArbitraryButton> getBaseButtons()
  {
    return baseButtons;
  }
  
  private void initializeMoves()
  {
    // Initialize Newt's CombatColors:
    
    newtColors = new CombatColor[3];
    newtColors[0] = constructNewtColor(Color.RED, new int[]{5, -5, 0}, 0, "Red");
    newtColors[1] = constructNewtColor(Color.BLUE, new int[]{0, 5, -5}, 1, "Blue");
    newtColors[2] = constructNewtColor(Color.YELLOW, new int[]{-5, 0, 5}, 2, "Yellow");
    
    // Initialize enemy's test CombatColor:
    
    colorBad = new CombatColor(Color.BLACK, new int[]{0, 0, 0}, 3);
    
    ArrayList<CombatMove> baddieMoves = new ArrayList<CombatMove>();
    CombatMove bad1 = new CombatMove(1);
    CombatMove bad2 = new CombatMove(2);
         
    bad1.setButton(constructMoveButton(new Point (0, 128), "Baddie 1"));
    bad2.setButton(constructMoveButton(new Point (0, 128), "Baddie 2"));

    bad1.setFireball(blackFireball);
    bad2.setFireball(blackFireball);
    println("blackFireball associated with enemy moveset");
    
    baddieMoves.add(bad1);
    baddieMoves.add(bad2);
    
    for(CombatMove curMove : baddieMoves)
    {
      curMove.setUser(enemy);
      curMove.setTarget(player);
    }

    colorBad.setMoves(baddieMoves);
  }
  
  public CombatColor constructNewtColor(Color myColor, int[] modifiers, int meterIndex, String string)
  {
    // Load fireball sprites:
    
    
    //BufferedImage redFireball = (BufferedImage) loadImage("/SpriteAnimations/Combat/AttackRed.png").getNative();
    //BufferedImage blueFireball = (BufferedImage) loadImage("/SpriteAnimations/Combat/AttackBlue.png").getNative();
    //BufferedImage yellowFireball = (BufferedImage) loadImage("/SpriteAnimations/Combat/AttackYellow.png").getNative();
    
    
    BufferedImage fireball = null;
    BufferedImage empFireball = null;
    BufferedImage ultFireball = null;
    
    try {
      //String urlString;
      //URL url = new URL(getCodeBase(), "examples/strawberry.jpg");
      
      
    if (myColor == Color.RED)
    {
      //fireball = ImageIO.read(new File("C:/Users/Wylie/Desktop/ChromaticOdysseyPrototype/ChromaticOdyssey/data/SpriteAnimations/Combat/AttackRed.png"));
      fireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-red-small.png")));
      empFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-red.png")));
      ultFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-red-large.png")));
      //fireball = redFireball;
      //urlString = "Data/SpriteAnimations/Combat/AttackRed.png";
    }
    
    else if (myColor == Color.BLUE)
    {
fireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-blue-small.png")));
      empFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-blue.png")));
      ultFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-blue-large.png")));      //fireball = blueFireball;
      //urlString = "Data/SpriteAnimations/Combat/AttackBlue.png";

    }
    
    else if (myColor == Color.YELLOW)
    {
       fireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-yellow-small.png")));
      empFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-yellow.png")));
      ultFireball = ImageIO.read(new File(dataPath("SpriteAnimations/Combat/fireball-yellow-large.png")));
       //fireball = yellowFireball;
       //urlString = "Data/SpriteAnimations/Combat/AttackYellow.png";
 
    }
    
    } catch(IOException e) { println(e); }
    
    //fireball = redFireball;
    
    // Call CombatColor and CombatMove constructors:
    CombatColor newColor = new CombatColor(myColor, modifiers, meterIndex);
    CombatMove base = new CombatMove(1, 1);
    CombatMove emp = new CombatMove(2);
    CombatMove ult = new CombatMove(4);
    
    base.setFireball(fireball);
    emp.setFireball(empFireball);
    ult.setFireball(ultFireball);
    
    
    // Construct Buttons and assosciate with respective CombatMoves:
    base.setButton(new MoveButton(new Point(0, 128), string + " Base", this, base));
    emp.setButton(new MoveButton(new Point(0, 256), string + " Emp", this, emp));
    ult.setButton(new MoveButton(new Point(0, 384), string + " Ult", this, ult));
    
    // Assemble CombatMove moveset:
    ArrayList<CombatMove> moves = new ArrayList<CombatMove>();
    moves.add(base);
    moves.add(emp);
    moves.add(ult);
    
    // Configure all moves in moveset:
    
    for(CombatMove move : moves)
    {
      move.setUser(player);
      move.setTarget(enemy);
    }
    
    // Assign configured moveset to new CombatColor:
    newColor.setMoves(moves);
    return newColor;
  }
  
  public ArbitraryButton constructMoveButton(Point point, String string)
  {
    Font buttonFont = new Font("TimesRoman", Font.BOLD, 18);
    Point strPt = new Point(128, 64);
    return imageMaker.constructItemButton(point, buttonFont, string, strPt);
  }
  
  private void initializeMenus()
  {
    //menus.add(initializeBaseMenu());
    baseButtons = new ArrayList<ArbitraryButton>();
      
    baseButtons.add(new MenuButton(this, ATTACK + 1, "Attack", new Point(200, 72), new Point(0, 640)));
    //baseButtons.add(new ExitButton(this, "Flee", new Point(212, 72), new Point(0, 640)));
    //baseButtons.add(new MenuButton(this, ITEM, "Item", new Point(212, 72), new Point(512, 512)));
    baseButtons.add(new MenuButton(this, COLOR, "Color", new Point(212, 72), new Point(512, 640)));
    
    baseMenu = new BaseCombatMenu(this);
    attackMenu = new AttackCombatMenu(this);
    
    menus.add(baseMenu);
    menus.add(attackMenu);    
    menus.add(new ItemCombatMenu(this));
    menus.add(new ColorCombatMenu(this));
    menus.add(initializeEndMenu());
  }
  
  public int[] getInventory()
  {
    return inventory;
  }
    
  public CustomMenu initializeEndMenu()
  {
    ArrayList<ArbitraryButton> endButtons = new ArrayList<ArbitraryButton>();
    endButtons.add(new ExitButton(this, "Finish", new Point(212, 72), new Point(0, 512)));
    
    BufferedImage endImg = new BufferedImage(1024, 768, BufferedImage.TYPE_INT_ARGB);
    
    CustomDisplay endDisplay = new CustomDisplay(endImg, new Point(0, 0));
    ArrayList<CustomDisplay> endDisplays = new ArrayList<CustomDisplay>();
    endDisplays.add(endDisplay);
    
    return new CustomMenu(endButtons, endDisplays);
  }
  
  // =====================================
  
  // Menu management:
  
  public void drawActive()
  {
    //updateFireballDisplay();
    drawBaseDisplays();
    activeMenu.drawMenu(g2d);
  }
  
  public void updateNewtFireballDisplay()
  {
    baseMenu.updateNewtFireballDisplay();
  }
  
  public void drawBase()
  {
    menus.get(BASE).drawMenu(g2d);
  }
  
  public void setActive(int index)
  {
    if(index != BASE) drawBase();
    activeMenu = menus.get(index);
  }
  
  public void setMenus(ArrayList<CustomMenu> newMenus)
  {
    menus = newMenus;
  }
  
  public void drawBaseDisplays()
  {
    menus.get(BASE).drawDisplays(g2d);
  }
  
  public void updateBaseDisplays()
  {
    menus.get(BASE).updateDisplays();
  }
   
  public void updateActiveDisplays()
  {
    activeMenu.updateDisplays();
  }
  
  public void hoverCheck()
  {
    activeMenu.checkForHover();
  }
  
  public void pressCheck()
  {
    activeMenu.checkForPress(g2d);
  }
  
  public CustomMenu getMenu(int index)
  {
    return menus.get(index);
  }
  
  public CombatColor[] getNewtColors()
  {
    return newtColors;
  }
  
  public void updateAttackMenuButtons()
  {
    menus.get(1).changeButtons(player.getActiveColor().getButtons(), player.getActiveColor().getMeteredButtons());
  }
  
  // =====================================

  // Game logic:
  
  private CombatMove[] getMovesBySpeed(CombatMove playerMove, CombatMove enemyMove)
  {
    CombatMove[] movesBySpeed = new CombatMove[2];
    if(player.getSpeed() >= enemy.getSpeed())
    {
      movesBySpeed[0] = playerMove;
      movesBySpeed[1] = enemyMove;
    }
    else
    {
      movesBySpeed[0] = enemyMove;
      movesBySpeed[1] = playerMove;
    }
    
    return movesBySpeed;
  }
  
  public boolean fireballTriggered()
  {
    return fireballTriggered;
  }
  
  public void untriggerFireball()
  {
    fireballTriggered = false;
  }
  
  public void startNewFight(GameCharacterName enemyName)
  {
    player.resetStats();
    //enemy.resetStats();
    enemy.changeIdentity(enemyName);
    activeMenu = menus.get(0);
    activeMenu.updateDisplays();
    activeMenu.drawMenu(g2d);
    if (enemyName == GameCharacterName.PRAGMA) sounds.playLevelTheme("PRAGMA_FIGHT");
    else if (enemyName == GameCharacterName.MYTHRA) sounds.playLevelTheme("MYTHRA_FIGHT");
    inCombat = true;
  }

  public void processTurn(CombatMove playerMove)
  {
   // lockMouseInput = true;
    
    CombatMove enemyMove = enemy.getRandomMove();
    CombatMove[] movesBySpeed = getMovesBySpeed(playerMove, enemyMove);
    
    for(CombatMove move : movesBySpeed)
    {
      //Combatant player = move.getUser();
      println("Move logic has begun");
      
      // Perform move animations:
      if(! (move instanceof CombatItem))
      {
        // Fireball animation
        println("Fireball animation has begun");
        if(move.getUser() == player)
        {
          println("Newt fireball firing");
          baseMenu.triggerNewtFireball(move.getFireballSprite());
        }
        
        println("Fireball animation is ending");
      }
       
      // Perform game logic processing and explosion animation:
      move.execute();    
      
      if(player.isDead() || enemy.isDead())
      {
        endGame();
        return;
      }
    }
    updateAttackMenuButtons();
    activeMenu = menus.get(BASE);
    //lockMouseInput = false;
  }
  
  public void endGame()
  {
    // Stop theme music
    sounds.stopCurrentTrack();
    // Update the base displays to reflect results of ending turn:
    inCombat = false;
    
    if(player.isDead())
    {
      if (enemy.getName() == "MYTHRA") world.setDiedToMythra();
      else if (enemy.getName() == "PRAGMA") world.setDiedToPragma();
      dispatcher.dispatch(new LevelTransitionEvent(LevelName.GAME_OVER, LevelName.GAME_OVER.getDescription()));
    }
    if(enemy.isDead())
    {
      if(enemy.getName() == "MYTHRA")
      {
        world.setMythraDefeated();
        // dispatch post-Mythra cutscene
        dispatcher.dispatch(new LevelTransitionEvent(LevelName.MYTHRA_DEFEATED, LevelName.MYTHRA_DEFEATED.getDescription()));
      }
      else if (enemy.getName() == "PRAGMA")
      {
        dispatcher.dispatch(new LevelTransitionEvent(LevelName.OUTRO, LevelName.OUTRO.getDescription()));
      }
    }
    /*
    updateBaseDisplays();
    drawBase();
    //menus.get(END).updateDisplays();
    activeMenu = menus.get(END); 
    */
    
  }
  
  public Combatant getPlayer()
  {
    return player;
  }
  
  public Combatant getEnemy()
  {
    return enemy;
  }
  
  // =====================================
  
  // Make PImage for Processing draw loop:

  public BufferedImage getImg()
  {
    return img;
  }
    
  public PImage getAsPImage(BufferedImage image)
  {
    PImage pimg = new PImage(image.getWidth(),image.getHeight(),PConstants.ARGB);
    image.getRGB(0, 0, pimg.width, pimg.height, pimg.pixels, 0, pimg.width);
    pimg.updatePixels();
    return pimg;
  }
  
}