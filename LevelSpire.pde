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
    
    this.triggers.add(new DialogTrigger(1000, 1100, 1200, 50, this.conversations.get(0), new FadeToCombatEvent(GameCharacterName.PRAGMA, this.name, 840, 560)));
    if (DEBUG.DEV_MODE) this.triggers.add(new LevelTransitionTrigger(1000, 1300, 600, 100, LevelName.THRONE_ROOM, 1000, 100));
    
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