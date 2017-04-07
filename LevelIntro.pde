//import processing.video.*;


class LevelIntro extends Level {
  
  // Image for castle enter prompt
  

  // Constructor
  public LevelIntro() {
    super(LevelName.INTRO);
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