class LevelMythraDefeated extends Level {
  
  
  // Constructor
  public LevelMythraDefeated() {
    super(LevelName.MYTHRA_DEFEATED, width/2 , height/2);
    loadAssets();
  }
  
  
  public void checkpointReset(){
    if(MYTHRA_DEFEATED.time()==MYTHRA_DEFEATED.duration()){
      introScreen = new Movie(master, "TitleScreen.mp4");
      introStory = new Movie(master, "Intro.mp4");
      OUTRO = new Movie(master, "Outro.mp4");
      GAME_OVER = new Movie(master, "Game Over.mp4");
      MYTHRA_DEFEATED = new Movie(master, "Mythra.mp4");
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
    this.hitboxImage = loadImage("LevelBackgrounds/MythraDefeated/HitboxLayer.png");    
    this.backgroundImage = loadImage("LevelBackgrounds/MythraDefeated/Bottom.png");
    this.foregroundImage = loadImage("LevelBackgrounds/MythraDefeated/Top.png");
    this.characters.add(newt);
  }
  
  public void movieEvent(Movie m) {
    m.read();
  }
  
}