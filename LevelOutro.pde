//import processing.video.*;


class LevelOutro extends Level {
  
  // Image for castle enter prompt
  

  // Constructor
  public LevelIntro() {
    super(LevelName.OUTRO,0,0);
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