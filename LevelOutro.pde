//import processing.video.*;


class LevelOutro extends Level {
  
  
  // Constructor
  public LevelOutro() {
    super(LevelName.OUTRO, width/2 , height/2);
    
    loadAssets();
  }
  
  public void setStartPosition() {
    newt.setXPos(START_X);
    newt.setYPos(START_Y);    
  }
    public void checkpointReset(){
        if(OUTRO.time()==OUTRO.duration()){
            runIntroStory = false;
            setup();
        }
    }
  public void initialize() {}
  
  // Load image assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("LevelBackgrounds/Outro/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/Outro/Bottom.png");
    this.foregroundImage = loadImage("LevelBackgrounds/Outro/Top.png");
    
    this.characters.add(newt);
  }
  
  public void movieEvent(Movie m) {
    m.read();
  }
}