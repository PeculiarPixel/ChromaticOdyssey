abstract class Level { 
 
  protected ArrayList<GameCharacter> characters;
  protected ArrayList<Landscape> landscapes;
  protected ArrayList<Trigger> triggers;
  protected ArrayList<Hitbox> hitboxes;
  protected ArrayList<Script> conversations;
  
  //public ArrayList<Movie> cutscenes;
  //public ArrayList<Item> items;
  //public ArrayList<Menu> menus;
  
  protected PImage backgroundImage;      // Level's background image
  protected PImage foregroundImage;      // Level's foreground image
  protected PImage hitboxImage;          // Level's hitbox image
  
  
  protected Fog fog;
  protected Level() {
    
    this.characters = new ArrayList<GameCharacter>();
    this.landscapes = new ArrayList<Landscape>();
    this.conversations = new ArrayList<Script>();
    this.triggers = new ArrayList<Trigger>();
    this.hitboxes = new ArrayList<Hitbox>();
    this.fog = new Fog(0,0,0);
    
  }
  
  abstract void loadAssets();
  abstract void setStartPosition();
  
  
  // Get level size
  public LevelSize getStateSize() {
    return new LevelSize(backgroundImage.width, backgroundImage.height);
  }
  
  // Get current script
  public Script getCurrentScript(int index) { return this.conversations.get(index); }
  
  // Get current script's next line
  public String getNextLine(int index) { return this.conversations.get(index).nextLine(); }
  
  public boolean hasNextLine(int index) { 
     if (this.conversations.get(index).isFinished()) return false;
     return true;
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
    camera.setTrackTarget(this.characters.get(0));
    camera.setLevelSize(0, getStateSize().w, 0, getStateSize().h);
    
  }
  

}

public enum LevelName {
  EMERALD_FOREST, EMERALD_FOREST_CAVE,
  KIT_PRISM_INNER, WORLD_PRISM_INNER, CASTLE_APPROACH, CASTLE_COURTYARD,
  CASTLE_HUB, LIBRARY, THRONE_ROOM, MASTER_BEDROOM, KIT_BEDROOM,
  SPIRE, TEST_0, TEST_1;
}