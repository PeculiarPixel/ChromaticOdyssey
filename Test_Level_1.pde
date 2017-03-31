// Default Test Level 1
class Test_Level_1 extends Level {
  
  private final float START_X = 3650;
  private final float START_Y = 900;
  
  public Test_Level_1(){
    super();
    loadAssets();
  }
  
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);  
  }
  
  // Load all assets for this level
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("hitboxLayer.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
   
   loadCharacters();
   loadLandscapes();
   loadConversations();
    
    
  }
  
  // Load characters
  private void loadCharacters() {
    this.characters.add(newt);
  }
  
  // Load landscapes
  private void loadLandscapes() {
  
    this.landscapes.add(new Landscape(350, 350,100,100)); 
    this.triggers.add(new LevelTransitionTrigger(235, 2750, 100, 100, LevelName.TEST_0));
    this.landscapes.add(new Landscape(300, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
  }
  
  private void loadConversations() {
    
    // Load test conversation
    try{
      this.conversations = fileUtils.getLevelConversations("levelScripts/level1");
     } catch (DirectoryNotFoundException e) {
          println(e.getLocalizedMessage());
    }
  
  }
    
}