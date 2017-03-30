abstract class Level { 
 
  protected ArrayList<GameCharacter> characters;
  protected ArrayList<Landscape> landscapes;
  protected ArrayList<Trigger> triggers;
  protected ArrayList<Hitbox> hitboxes;
  protected ArrayList<Dialog> conversations;
  
  //public ArrayList<Movie> cutscenes;
  //public ArrayList<Item> items;
  //public ArrayList<Menu> menus;
  
  protected PImage backgroundImage;      // Level's background image
  protected PImage foregroundImage;      // Level's foreground image
  protected PImage hitboxImage;          // Level's hitbox image
  
  protected Level() {
    
    this.characters = new ArrayList<GameCharacter>();
    this.landscapes = new ArrayList<Landscape>();
    this.conversations = new ArrayList<Dialog>();
    this.triggers = new ArrayList<Trigger>();
    this.hitboxes = new ArrayList<Hitbox>();
    
  }
  
  abstract void loadAssets();
  abstract void setStartPosition();
  abstract void initialize();

}