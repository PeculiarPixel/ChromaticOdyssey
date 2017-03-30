// Default Test Level 0
class Test_Level_0 extends Level {
  
  public Test_Level_0() {
    super();
    loadAssets();
  }

  public Level nextState() {
    comp.clear();
    Test_Level_1 next = new Test_Level_1();
    return next;
  }
  
  public void setStartPosition() {}
  
  public void initialize() {
    for (Landscape l : landscapes) { l.initialize(); }
    for (Trigger t : triggers) { t.initialize(); }
    for (Hitbox h : hitboxes) { h.initialize(); }
  }
  
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("CastleWalkup.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    
    //this.landscapes.add(new Landscape(350, 350,100,100));
    this.triggers.add(new DialogTrigger(350, 350, 100, 100, 1));
    this.triggers.add(new LevelTransitionTrigger(300, 120, 100, 100, 0));
    this.landscapes.add(new Landscape(120, 120, 100, 100));
    //this.landscapes.add(new Landscape(300, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
    
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level0");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }

}