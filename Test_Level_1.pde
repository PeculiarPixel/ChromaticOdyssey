// Default Test Level 1
class Test_Level_1 extends Level {
  
  private final float START_X = 3650;
  private final float START_Y = 900;
  
  public Test_Level_1(){
    super(LevelName.TEST_1,3650,900);
    loadAssets();
  }
  
  public void setStartPosition() {
    newt.setXPos(START_X);
    newt.setYPos(START_Y);  
    kit.setXPos(START_X - 30);
    kit.setYPos(START_Y - 30);  
  }
  
  // Load all assets for this level
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/CastleApproach/hitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/CastleApproach/hitboxLayer.png");
    this.foregroundImage = loadImage("LevelBackgrounds/CastleApproach/CastleWalkupTopLayer.png");
   
   loadCharacters();
   loadLandscapes();
   loadConversations();
    
    
  }
  
  // Load characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);
  }
  
  // Load landscapes
  private void loadLandscapes() {
  
    this.landscapes.add(new Landscape(350, 350,100,100)); 
    //this.triggers.add(new LevelTransitionTrigger(235, 2750, 100, 100, LevelName.TEST_0));
    this.landscapes.add(new Landscape(300, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
  }
  
  private void loadConversations() {
    
    // Load test conversation
    try{
      this.conversations = fileUtils.getLevelConversations("levelScripts/test1");
     } catch (DirectoryNotFoundException e) {
          println(e.getLocalizedMessage());
    }
  
  }
    
}