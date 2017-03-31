class LevelCastleApproach extends Level {
  
  // Image for castle enter prompt
  public PImage enterCastlePrompt;

  // Constructor
  public LevelCastleApproach() {
    super();
    loadAssets();
  }
  
  public void setStartPosition() {}
  
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {
    this.backgroundImage = loadImage("CastleWalkup.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    this.hitboxImage = loadImage("hitboxLayer.png");
    this.enterCastlePrompt = loadImage("EnterCastlePrompt.png");
  }
  
}