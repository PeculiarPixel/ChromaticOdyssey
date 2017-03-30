// Default Test Level 1
class Test_Level_1 extends Level {
  
  private final int START_X = 0;
  private final int START_Y = 0;
  
  public Test_Level_1(){
    super();
    loadAssets();
  }
  
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);  
  }
  
    // Initialize all assets, characters, &c into comp engine
  public void initialize() {
    
    for (GameCharacter c : characters) { c.initialize(); }
    for (Landscape l : landscapes) { l.initialize(); }
    for (Trigger t : triggers) { t.initialize(); }
    for (Hitbox h : hitboxes) { h.initialize(); }
    
  }
  
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("hitboxLayer.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    
    this.landscapes.add(new Landscape(350, 350,100,100)); 
    this.triggers.add(new LevelTransitionTrigger(120, 300, 100, 100, 0));
    this.landscapes.add(new Landscape(300, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
     
    this.characters.add(newt);
   
    
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level1");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    } 
  }
    
}