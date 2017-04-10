// MasterBedroom Level
class LevelMasterBedroom extends Level {

   
  public float START_X = 2400;
  public float START_Y = 700;
  
  
  // Constructor
  public LevelMasterBedroom() {
    super(LevelName.MASTER_BEDROOM,2400,900);
    
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
    
    mythra.setXPos(START_X-1600);
    mythra.setYPos(START_Y-200);
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);
    this.characters.add(mythra);

  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
  
   // Dialog
  this.triggers.add(new DialogTrigger(2300, 950, 100, 400, this.conversations.get(0)));
  this.triggers.add(new DialogTrigger(1250, 950, 100, 400, this.conversations.get(1)));
  
  // Transition back to HUB
  this.triggers.add(new LevelTransitionTrigger(2500, 700, 100, 600, LevelName.CASTLE_HUB, 250, 750));
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/MasterBedroom");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/MasterBedroom/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/MasterBedroom/Bottom.png");

    this.foregroundImage = loadImage("LevelBackgrounds/MasterBedroom/Top.png");
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
    // Setup fog
    this.fogs.add(new Fog(getStateSize().w / 2, getStateSize().h / 2, 1000, 0.05, width, height, 2));
    this.fogs.add(new Fog(840, 550, 30, 0.25, 125, 125, 0.50));
    
  }

}