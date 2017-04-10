class LevelGameOver extends Level {
  
  
  // Constructor
  public LevelGameOver() {
    super(LevelName.GAME_OVER, width/2 , height/2);
    loadAssets();
  }
  
  
  public void checkpointReset(){
    if(GAME_OVER.time()==GAME_OVER.duration()){
      introScreen = new Movie(master, "TitleScreen.mp4");
      introStory = new Movie(master, "Intro.mp4");
      OUTRO = new Movie(master, "Outro.mp4");
      GAME_OVER = new Movie(master, "Game Over.mp4");
      state.setState(state.checkpoint.getName());
    }
  }
  

  public void setStartPosition() {
      newt.setXPos(START_X);
      newt.setYPos(START_Y);
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