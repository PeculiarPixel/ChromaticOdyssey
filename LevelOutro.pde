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
    this.characters.add(newt);
  }
  
  public void movieEvent(Movie m) {
    m.read();
  }
}