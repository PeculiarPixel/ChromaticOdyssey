abstract class Level { 
 
  protected ArrayList<GameCharacter> characters;
  protected ArrayList<Landscape> landscapes;
  protected ArrayList<Dialog> conversations;
  
  //public ArrayList<Movie> cutscenes;
  //public ArrayList<Item> items;
  //public ArrayList<Menu> menus;
  
  protected PImage backgroundImage;      // Level's background image
  protected PImage foregroundImage;      // Level's foreground image
  protected PImage hitboxImage;          // Level's hitbox image
  
  Level() {
    this.characters = new ArrayList<GameCharacter>();
    this.landscapes = new ArrayList<Landscape>();
    this.conversations = new ArrayList<Dialog>();
  }
  
  abstract void loadAssets();
  abstract Level changeLevel();
  abstract void setStartPosition();

}