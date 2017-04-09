class LevelGameOver extends Level {
  
  
  // Constructor
  public LevelGameOver() {
    super(LevelName.GAME_OVER, width/2 , height/2);
    
    loadAssets();
  }
  
  public void setStartPosition() {}
  
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {
    this.characters.add(newt);
    newt.setXPos(START_X);
    newt.setYPos(START_Y);
  
  }
  
  public void movieEvent(Movie m) {
    m.read();
  }
  
}