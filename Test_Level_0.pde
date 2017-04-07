// Default Test Level 0
class Test_Level_0 extends Level {
  
  
  private final float START_X = 235;
  private final float START_Y = 2750;
  
  // Saved coords for starting close to transition
  //private final float START_X = 3550;
  //private final float START_Y = 1000;
  
  // Constructor
  public Test_Level_0() {
    super(LevelName.TEST_0);
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
    
    this.triggers.add(new DialogTrigger(700, 2550, 100, 100, this.conversations.get(0)));
    this.triggers.add(new DialogTrigger(300, 2750, 100, 100, this.conversations.get(1)));
    this.triggers.add(new LevelTransitionTrigger(3650, 900, 100, 100, LevelName.TEST_1));
    this.triggers.add(new CombatTransitionTrigger(500, 2750, 100, 100, null));
    this.landscapes.add(new Landscape(120, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/test0");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/CastleApproach/hitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/CastleApproach/CastleWalkup.png");
    this.foregroundImage = loadImage("LevelBackgrounds/CastleApproach/CastleWalkupTopLayer.png");
    this.fog = new Fog(3500,2000,1500);
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
  }
  
}