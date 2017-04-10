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
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/Intro/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/Intro/Bottom.png");
    this.foregroundImage = loadImage("LevelBackgrounds/Intro/Top.png");
      introScreen.loop();
  }
  
  public void movieEvent(Movie m) {
    m.read();
  }
  
}