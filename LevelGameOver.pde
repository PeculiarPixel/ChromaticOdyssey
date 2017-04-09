class GameOver extends Level {
  
  

  // Constructor
  public LevelIntro() {
    super(LevelName.GAME_OVER,0,0);
    loadAssets();
  }
  
  public void setStartPosition() {}
  
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {}
  
  public void movieEvent(Movie m) {
    m.read();
  }
  
}