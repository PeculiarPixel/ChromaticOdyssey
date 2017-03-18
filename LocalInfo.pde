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
      hitbox = new Hitbox(x,  y, sizeX, sizeY, color(0, 255, 0), "player",-1);
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
    
    boolean releaseDirection(MoveDirection direction) {
      
      MoveDirection lastDirection;
        
      switch(direction) {
          case LEFT:
            moveLeft = false;
            lastDirection = MoveDirection.LEFT;
            break;
          case RIGHT:
            moveRight = false;
            lastDirection = MoveDirection.RIGHT;
            break;
          case UP:
            moveUp = false;
            lastDirection = MoveDirection.UP;
            break;
          case DOWN:
           moveDown = false;
           lastDirection = MoveDirection.DOWN;
           break;
           default:
             lastDirection = MoveDirection.DOWN;
        }    
      
        if (!isMoving()) {
          
          switch(lastDirection) {
            case LEFT:
               this.direction = MoveDirection.IDLE_LEFT;
               break;
            case RIGHT:
              this.direction = MoveDirection.IDLE_RIGHT;
              break;
            case UP:
              this.direction = MoveDirection.IDLE_UP;
              break;
            case DOWN:
              this.direction = MoveDirection.IDLE_DOWN;
              break;
            default:
              this.direction = MoveDirection.IDLE_DOWN;
          }
          
          println("Current direction: " + this.direction);
          return true;
          
        }
        
        return false;
  
    }
    
    boolean isMoving() {
      if (moveLeft || moveRight || moveUp || moveDown) return true;
      return false;
    }
    
    boolean isDirectionChange(MoveDirection newDirection) {
      if (this.direction != newDirection) return true;
      return false;
    }
    
    // Get direction
    public MoveDirection getDirection() { return this.direction; }

}

enum MoveDirection {
  LEFT, RIGHT, UP, DOWN, IDLE,
  IDLE_UP, IDLE_DOWN, IDLE_LEFT, IDLE_RIGHT;
}