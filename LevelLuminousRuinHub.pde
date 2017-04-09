// Main Castle Hub Level
class LevelLuminousRuinHub extends Level {
   
  
  // Saved coords for starting close to transition
  //private final float START_X = 3550;
  //private final float START_Y = 1000;
  
  // Constructor
  public LevelLuminousRuinHub() {
    super(LevelName.CASTLE_HUB, 1000, 1300);
    
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
    
    // Pre-mythra fight events
    if (world.isMythraDefeated()) {
      
      // Dialog event
      this.triggers.add(new DialogTrigger(700, 800, 100, 400, this.conversations.get(2)));
      
    } else {
      
      // Dialog events
      this.triggers.add(new DialogTrigger(1000, 1300, 400, 100, this.conversations.get(0)));
      this.triggers.add(new DialogTrigger(1000, 350, 400, 100, this.conversations.get(1)));
                        
      // Hitbox to block the throne room
      this.landscapes.add(new Landscape(1050, 200, 500, 200));
    
    }
   
   // Transition triggers
    this.triggers.add(new LevelTransitionTrigger(75, 750, 100, 600, LevelName.MASTER_BEDROOM, 2400, 900));
    this.triggers.add(new LevelTransitionTrigger(1000, 50, 600, 100, LevelName.THRONE_ROOM, 2400, 900));
    this.triggers.add(new LevelTransitionTrigger(1000, 1500, 600, 100, LevelName.CASTLE_APPROACH, 3550, 1100));
    
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
    this.backgroundImage = loadImage("LevelBackgrounds/LuminousRuinHub/HubBottom.png");

    this.foregroundImage = loadImage("LevelBackgrounds/LuminousRuinHub/HubTop.png");
   // this.fog = new Fog(3500,2000,1500);
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
  }

}