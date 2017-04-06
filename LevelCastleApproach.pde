class LevelCastleApproach extends Level {
  
  // Image for castle enter prompt
  public PImage enterCastlePrompt;

  // Constructor
  public LevelCastleApproach() {
    super(LevelName.CASTLE_APPROACH);
    loadAssets();
  }
  
  public void setStartPosition() {}
  
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {
    this.backgroundImage = loadImage("LevelBackgrounds/CastleApproach/CastleWalkup.png");
    this.foregroundImage = loadImage("LevelBackgrounds/CastleApproach/CastleWalkupTopLayer.png");
    this.hitboxImage = loadImage("LevelBackgrounds/CastleApproach/hitboxLayer.png");
    this.enterCastlePrompt = loadImage("LevelBackgrounds/CastleApproach/EnterCastlePrompt.png");
  }
  
}