// Main Castle Hub Level
class LevelLuminousRuinHub extends Level implements ObserverMythra {
   
  
  // Saved coords for starting close to transition
  //private final float START_X = 3550;
  //private final float START_Y = 1000;
  
  // Constructor
  public LevelLuminousRuinHub() {
    super(LevelName.CASTLE_HUB, 1000, 1300);
    
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
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);

  }
  
  public void onMythraDefeated() {
    this.triggers.get(0).activate();
    this.triggers.get(1).activate();
    this.triggers.get(2).deactivate();
    this.landscapes.remove(0);
    this.fogs.remove(1);
  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
      
    
      // Dialog events
      this.triggers.add(new DialogTrigger(1000, 1300, 600, 100, this.conversations.get(0)));
      this.triggers.add(new DialogTrigger(1000, 450, 600, 100, this.conversations.get(1)));
      
      this.triggers.add(new DialogTrigger(200, 800, 100, 600, this.conversations.get(2)));
      this.triggers.get(2).activate();
                        
      // Hitbox to block the throne room
      this.landscapes.add(new Landscape(1050, 200, 500, 200));
   
   // Transition triggers
    this.triggers.add(new LevelTransitionTrigger(75, 750, 100, 600, LevelName.MASTER_BEDROOM, 2400, 700));
    this.triggers.add(new LevelTransitionTrigger(1000, 50, 600, 100, LevelName.THRONE_ROOM, 2400, 900));
    this.triggers.add(new LevelTransitionTrigger(1000, 1500, 600, 100, LevelName.CASTLE_APPROACH, 3550, 1100));
    
    if (DEBUG.DEV_MODE) {
      this.triggers.add(new LevelTransitionTrigger(1700, 750, 100, 100, LevelName.GAME_OVER, width/2, height/2));
      this.triggers.add(new LevelTransitionTrigger(1700, 1000, 100, 100, LevelName.OUTRO, width/2, height/2));     
      this.triggers.add(new LevelTransitionTrigger(1000,600, 100, 100, LevelName.MYTHRA_DEFEATED, width/2, height/2));
    }
    
    // Hitbox to block the side hallway
    this.landscapes.add(new Landscape(2100, 800, 200, 500));
    
    // Combat triggers
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/LuminousRuinHub");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/LuminousRuinHub/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/LuminousRuinHub/Bottom.png");
    this.foregroundImage = loadImage("LevelBackgrounds/LuminousRuinHub/Top.png");
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
    // Setup level fog
    this.fogs.add(new Fog(getStateSize().w / 2, getStateSize().h / 2, 1000, 0.05, width, height, 2));
    this.fogs.add(new Fog(1025, 100, 1000, 5, 300, 200, 3));
    this.fogs.add(new Fog(2150, 800, 500, 5, 150, 300, 3));
    
  }

}