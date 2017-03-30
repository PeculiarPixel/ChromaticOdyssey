// Default Test Level 1
class Test_Level_1 extends Level {
  
  private final int START_X = 0;
  private final int START_Y = 0;
  
  public Test_Level_1(){
    super();
  }
  
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);  
  }
  
  public void initialize() {}
  
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("hitboxLayer.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    
    this.landscapes.add(new Landscape(350, 350,100,100)); 
    this.landscapes.add(new Landscape(120, 120, 100, 100));
    this.landscapes.add(new Landscape(300, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
    
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level1");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    } 
  }
    
}