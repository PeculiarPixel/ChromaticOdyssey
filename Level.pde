abstract class Level { 
 
  protected ArrayList<GameCharacter> characters;
  protected ArrayList<Landscape> landscapes;
  protected ArrayList<Trigger> triggers;
  protected ArrayList<Hitbox> hitboxes;
  protected ArrayList<Script> conversations;
  protected AudioPlayer theme;
  protected LevelName name;
  protected float START_X;
  protected float START_Y;
  //public ArrayList<Movie> cutscenes;
  //public ArrayList<Item> items;
  //public ArrayList<Menu> menus;
  
  protected PImage backgroundImage;      // Level's background image
  protected PImage foregroundImage;      // Level's foreground image
  protected PImage hitboxImage;          // Level's hitbox image
  
  
  protected ArrayList<Fog> fogs;
  protected Level(LevelName inputName, float x, float y) {
    
    this.characters = new ArrayList<GameCharacter>();
    this.landscapes = new ArrayList<Landscape>();
    this.conversations = new ArrayList<Script>();
    this.triggers = new ArrayList<Trigger>();
    this.hitboxes = new ArrayList<Hitbox>();
    this.fogs = new ArrayList<Fog>();
    this.name = inputName;
    this.START_X =x;
    this.START_Y =y;
    
  }
  
  abstract void loadAssets();
  abstract void setStartPosition();
  abstract void checkpointReset();
  public LevelName getName(){
    return this.name;
  }
  // Get level size
  public LevelSize getStateSize() {
    return new LevelSize(backgroundImage.width, backgroundImage.height);
  }
  //Set Level spawn point
  public void setStart(float x, float y){
    this.START_X = x;
    this.START_Y = y;
  }
  //Get Level spawn point
  public float getSTART_X(){
    return this.START_X;
  }
  public float getSTART_Y(){
    return this.START_Y;
  }
  // Initialize all assets, characters, &c into comp engine
  public void initialize() {
    
    // Loop through all assets and add initialize them
    for (GameCharacter c : characters) { c.initialize(); }
    for (Landscape l : landscapes) { l.initialize(); }
    for (Trigger t : triggers) { t.initialize(); }
    for (Hitbox h : hitboxes) { h.initialize(); }
    
    // Set Starting position for level
    setStartPosition();
    
    camera.setTrackTarget(newt);
    camera.setLevelSize(0, getStateSize().w, 0, getStateSize().h);
    
    if (DEBUG.MUSIC_ON) sounds.playLevelTheme(name);
    
  }
  
}