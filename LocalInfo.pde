class LocalInfo{

  private float xPos;  //the player's current position X
  private float yPos;  // the player's curent position Y
  private boolean moveUp;
  private boolean moveDown;
  private boolean moveLeft;
  private boolean moveRight;
  private boolean hitboxDisplay;
  private Hitbox hitbox;

  
  private int currHealth;
  private int currExperience;
  private int currMana;
 
//  
  
    LocalInfo(float x, float y,float sizeX, float sizeY, int h, int e, int m){
      xPos = x;
      yPos = y;
      currHealth = h;
      currExperience = e;
      currMana = m;
      moveUp = false;
      moveDown = false;
      moveLeft = false;
      moveRight = false;
      hitbox = new Hitbox(x,  y, sizeX, sizeY, color(0, 255, 0), "player");
      
    }

}