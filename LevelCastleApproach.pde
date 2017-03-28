class LevelCastleApproach extends Level {
  
  // Image for castle enter prompt
  public PImage enterCastlePrompt;

  // Constructor
  public LevelCastleApproach(GameCharacter Newt) {
    super();
    
    // Setup base character Newt
    this.characters.add(Newt);
    
    // Load assets
    loadAssets();
    
  }
  
  public void setStartPosition() {}
  
  // Load image assets
  public void loadAssets() {
    this.backgroundImage = loadImage("CastleWalkup.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    this.hitboxImage = loadImage("hitboxLayer.png");
    this.enterCastlePrompt = loadImage("EnterCastlePrompt.png");
  }
  
  // Swap to next level
  public Level changeLevel() {
    return null;
  }
  
}