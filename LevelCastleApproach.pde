class LevelCastleApproach extends Level {
  

  
  // Saved coords for starting close to transition
  //private final float START_X = 3550;
  //private final float START_Y = 1000;
  
  // Constructor
  public LevelCastleApproach() {
    super(LevelName.CASTLE_APPROACH, 235, 2750);
    
    if (DEBUG.QUICK_TRANSITION) {
      this.START_X = 3550;
      this.START_Y = 1000;
    }
    
    loadAssets();
  }
  
  public void checkpointReset(){}
  
  // Set Newt Starting Position
  public void setStartPosition() {

    newt.setXPos(START_X);
    newt.setYPos(START_Y);
    
    kit.setXPos(START_X);
    kit.setYPos(START_Y);
    
    //pragma.setXPos(START_X);
  //  pragma.setYPos(START_Y);
    
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    this.characters.add(newt);
    this.characters.add(kit);
   // this.characters.add(pragma);
  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
    
    this.triggers.add(new DialogTrigger(300, 2750, 100, 400, this.conversations.get(0)));
    this.triggers.add(new DialogTrigger(800, 2650, 100, 400, this.conversations.get(1)));
    this.triggers.add(new DialogTrigger(1500, 2100, 100, 400, this.conversations.get(2)));
    
    this.triggers.add(new LevelTransitionTrigger(3650, 850, 400, 125, LevelName.CASTLE_HUB,1000,1300));
    
    this.landscapes.add(new LandscapeLake(1625, 2675, 0, 0));
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/CastleApproach");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/CastleApproach/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/CastleApproach/Bottom.png");
    /*backgroundImage.loadPixels();
    for(int i =0; i<backgroundImage.pixels.length;i++){
      backgroundImage.pixels[i] =  color();
    }
    backgroundImage.updatePixels();*/
    this.foregroundImage = loadImage("LevelBackgrounds/CastleApproach/Top.png");
    
    this.fogs.add(new Fog(3500, 2000, 1800, 0.6, 1100, 1100, 0.5));
    
    loadConversations();
    loadLandscapes();
    loadCharacters();
    
  }
  
}