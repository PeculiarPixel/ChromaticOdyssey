//import processing.video.*;


class LevelIntro extends Level {
  
  // Image for castle enter prompt
  

  // Constructor
  public LevelIntro() {
    super(LevelName.INTRO,0,0);
    loadAssets();
  }
  
  public void setStartPosition() {}
    public void checkpointReset(){}
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {}
  
  public void movieEvent(Movie m) {
    m.read();
  }
  
}