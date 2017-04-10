// Throne Room Level
class LevelSpire extends Level {

 public float START_X = 1150;
 public float START_Y = 1100;
  
  
  // Constructor
  public LevelSpire() {
    super(LevelName.SPIRE,2400,900);
    
    if (DEBUG.QUICK_TRANSITION) {
      this.START_X = 3550;
      this.START_Y = 1000;
    }
    
    loadAssets();
  }
  
  
    public void checkpointReset(){}
  // Set Newt Starting Position
  public void setStartPosition() {
    GameCharacter newt = this.characters.get(0);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);
    
    kit.setXPos(START_X);
    kit.setYPos(START_Y);
    
    pragma.setXPos(START_X+100);
    pragma.setYPos(START_Y-500);
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);
    this.characters.add(pragma);
  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
    
  //  this.triggers.add(new DialogTrigger(300, 2750, 100, 400, this.conversations.get(0)));
   // this.triggers.add(new DialogTrigger(800, 2650, 100, 400, this.conversations.get(1)));
   // this.triggers.add(new DialogTrigger(1500, 2100, 100, 400, this.conversations.get(2)));
  //  this.triggers.add(new DialogTrigger(1900, 2100, 100, 400, this.conversations.get(3)));
   // this.triggers.add(new LevelTransitionTrigger(1000, 1300, 600, 100, LevelName.THRONE_ROOM,475, 500));
    //this.triggers.add(new LevelTransitionTrigger(500, 100, 100, 100, LevelName.SPIRE,1000, 200));
  //  this.landscapes.add(new Landscape(120, 120,  100, 100));
  //  this.landscapes.add(new Landscape(700, 120, 100, 100));
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/Spire");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/Spire/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/Spire/Bottom.png");

    this.foregroundImage = loadImage("LevelBackgrounds/Spire/Top.png");
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
    this.fogs.add(new Fog(getStateSize().w / 2, getStateSize().h / 2, 1000, 0.15, width, height, 2));
    this.fogs.add(new Fog(1250, 650, 30, 0.25, 125, 125, 0.8));
    
  }
}