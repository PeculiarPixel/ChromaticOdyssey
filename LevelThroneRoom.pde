// Throne Room Level
class LevelThroneRoom extends Level {
   
  public float START_X = 500;
  public float START_Y = 1450;
  
  
  // Constructor
  public LevelThroneRoom() {
    super(LevelName.THRONE_ROOM,2400,900);
    
    if (DEBUG.QUICK_TRANSITION) {
      this.START_X = 3550;
      this.START_Y = 1000;
    }
    
    loadAssets();
  }
  
  // Set Newt Starting Position
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);
    
    kit.setXPos(START_X);
    kit.setYPos(START_Y);
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);

  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
    
  //  this.triggers.add(new DialogTrigger(300, 2750, 100, 400, this.conversations.get(0)));
   // this.triggers.add(new DialogTrigger(800, 2650, 100, 400, this.conversations.get(1)));
   // this.triggers.add(new DialogTrigger(1500, 2100, 100, 400, this.conversations.get(2)));
  //  this.triggers.add(new DialogTrigger(1900, 2100, 100, 400, this.conversations.get(3)));
    this.triggers.add(new LevelTransitionTrigger(500, 1600, 600, 100, LevelName.CASTLE_HUB,1000, 200));
    this.triggers.add(new LevelTransitionTrigger(475, 150, 125, 100, LevelName.SPIRE,1000,1100));
  //  this.landscapes.add(new Landscape(120, 120,  100, 100));
  //  this.landscapes.add(new Landscape(700, 120, 100, 100));
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/ThroneRoom");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/ThroneRoom/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/ThroneRoom/Bottom.png");

    this.foregroundImage = loadImage("LevelBackgrounds/ThroneRoom/Top.png");
   // this.fog = new Fog(3500,2000,1500);
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
  }
}