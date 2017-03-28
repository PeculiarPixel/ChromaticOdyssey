// Default Test Level 0
class Test_Level_0 extends Level {
  
  public Test_Level_0(GameCharacter Newt) {
    super();
  
    // Add Newt
    characters.add(Newt);
    
    // Load assets
    loadAssets();
  
  }

  public Level nextState() {
    comp.clear();
    Test_Level_1 next = new Test_Level_1(newt);
    return next;
  }
  
  public void setStartPosition() {}

  public Level changeLevel() { return null; }
  
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    backgroundImage = loadImage("CastleWalkup.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    this.landscapes.add(new Landscape(350, 350,100,100, "Landscape", -1)); 
    this.landscapes.add(new Landscape(120, 120, 100, 100, "EventBox", -1));
    this.landscapes.add(new Landscape(300, 120, 100, 100, "DialogBox", 0));
    this.landscapes.add(new Landscape(700, 120, 100, 100, "DialogBox", 1));
    
    
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level0");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }

}