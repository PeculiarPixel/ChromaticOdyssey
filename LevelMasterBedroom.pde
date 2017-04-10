// MasterBedroom Level
class LevelMasterBedroom extends Level implements ObserverMythra {


  public float START_X = 2400;
  public float START_Y = 700;
  
  private boolean combatPositions = false;


  // Constructor
  public LevelMasterBedroom() {
    super(LevelName.MASTER_BEDROOM, 2400, 900);

    loadAssets();
  }


  public void checkpointReset() {
  }
  // Set Newt Starting Position
  public void setStartPosition() {
    
    if (combatPositions) {
      newt.setXPos(800);
      newt.setYPos(700);
      kit.setXPos(800);
      kit.setYPos(700);
      this.combatPositions = false;
    }
    else {
      newt.setXPos(START_X);
      newt.setYPos(START_Y);
  
      kit.setXPos(START_X);
      kit.setYPos(START_Y);
    }
    
    mythra.setXPos(START_X-1600);
    mythra.setYPos(START_Y-200);
  }

  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);
    this.characters.add(mythra);
  }

  public void onMythraDefeated() {
    this.triggers.get(2).deactivate();
    this.triggers.add(new LevelTransitionTrigger(2500, 700, 100, 600, LevelName.CASTLE_HUB, 250, 750));
    this.triggers.get(3).initialize();
    this.fogs.remove(1);
    this.combatPositions = true;
  }

  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {

    // Dialog
    this.triggers.add(new DialogTrigger(2300, 650, 50, 500, this.conversations.get(0)));
    this.triggers.add(new DialogTrigger(1050, 650, 50, 600, this.conversations.get(1), new FadeToCombatEvent(GameCharacterName.MYTHRA, this.name, 840, 560)));

    this.triggers.add(new DialogTrigger(800, 650, 50, 600, this.conversations.get(2)));  
    this.triggers.get(2).activate();
  }

  // Load level conversations
  private void loadConversations() {
    // Load test conversation
    try {
      this.conversations = fileUtils.getLevelConversations("levelScripts/MasterBedroom");
    } 
    catch (DirectoryNotFoundException e) {
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