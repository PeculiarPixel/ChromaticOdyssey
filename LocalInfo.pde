class LocalInfo{

  private float xPos;  //the player's current position X
  private float yPos;  // the player's curent position Y
  private boolean moveUp;
  private boolean moveDown;
  private boolean moveLeft;
  private boolean moveRight;
  private MoveDirection direction;
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
    
    
    
    void setDirection(MoveDirection direction) {
      
      if (isDirectionChange(direction)) {
        
        this.direction = direction;
        switch(direction) {
          case LEFT:
            moveLeft = true;
            break;
          case RIGHT:
            moveRight = true;
            break;
          case UP:
            moveUp = true;
            break;
          case DOWN:
           moveDown = true;
           break;
        }
        
        println("Current direction: " + this.direction);
        
      }
        
         
    }
    
    void releaseDirection(MoveDirection direction) {
        
      switch(direction) {
          case LEFT:
            moveLeft = false;
            break;
          case RIGHT:
            moveRight = false;
            break;
          case UP:
            moveUp = false;
            break;
          case DOWN:
           moveDown = false;
           break;
        }    
      
        if (!isMoving()) {
          this.direction = MoveDirection.IDLE;
          println("Current direction: " + this.direction);
        }
        
    }
    
    boolean isMoving() {
      if (moveLeft || moveRight || moveUp || moveDown) return true;
      return false;
    }
    
    boolean isDirectionChange(MoveDirection newDirection) {
      if (this.direction != newDirection) return true;
      return false;
    }

}

enum MoveDirection {
  LEFT, RIGHT, UP, DOWN, IDLE;
}