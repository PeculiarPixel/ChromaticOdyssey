// Default Test Level 1
class Test_Level_1 extends Level {
  
  private final int START_X = 0;
  private final int START_Y = 0;
  
  public Test_Level_1(GameCharacter Newt){
    super();
    
    // Add Newt
    characters.add(Newt);
    
    // Load assets
    loadAssets();
    
    // Setup newt start position
    setStartPosition();
  
  }

  public Level nextState() {
    comp.clear();
    Test_Level_0 next = new Test_Level_0(newt);
    return next;
  }
  
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);  
  }

  public Level changeLevel() { return null; }
  
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("hitboxLayer.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    this.landscapes.add(new Landscape(350, 350,100,100, "Landscape", -1)); 
    this.landscapes.add(new Landscape(120, 120, 100, 100, "EventBox", -1));
    this.landscapes.add(new Landscape(300, 120, 100, 100, "DialogBox", 0));
    this.landscapes.add(new Landscape(700, 120, 100, 100, "DialogBox", 1));
    
    
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level1");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    } 
  }
    
}