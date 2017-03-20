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
 
  
  // Constructor
  LocalInfo(float x, float y,float sizeX, float sizeY, int h, int e, int m) {
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
    
    
    // Set character local direction
    public void setDirection(MoveDirection direction) {
      
      // Change direction only if direction is new
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
        
        // Log direction
        println("Current direction: " + this.direction);
        
      }
        
         
    }
    
    // Release movement direction
    public boolean releaseDirection(MoveDirection direction) {
      
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
    
    // Check if character is currently moving
    public boolean isMoving() {
      if (moveLeft || moveRight || moveUp || moveDown) return true;
      return false;
    }
    
    // Check if new direction changes direction from previous direction
    public boolean isDirectionChange(MoveDirection newDirection) {
      if (this.direction != newDirection) return true;
      return false;
    }
    
    // Get direction
    public MoveDirection getDirection() { return this.direction; }
    
    // Move Character along Y axis
    public void moveY(float amount) {
      this.yPos += amount;
    }
    
    // Move Character along X axis
    public void moveX(float amount) {
      this.xPos += amount;
    } 
    
    // Get X Position of Character
    public float getXPos() { return this.xPos; }
    
    // Get Y Position of Character
    public float getYPos() { return this.yPos; }
    
    // Set X Position of Character
    public void setXPos(float pos) { this.xPos = pos; }
    
    // Set Y Position of Character
    public void setYPos(float pos) { this.yPos = pos; }
    
    // Get Hitbox X Position
    public float getHitboxXPos() { return this.hitbox.getXPos(); }
    
    // Get Hitbox Y Position
    public float getHitboxYPos() { return this.hitbox.getYPos(); }
    
    // Set Hitbox X Position
    public void setHitboxXPos(float pos) { this.hitbox.setXPos(pos); }
    
    // Set Hitbox Y Position
    public void setHitboxYPos(float pos) { this.hitbox.setYPos(pos); }

}

enum MoveDirection {
  LEFT, RIGHT, UP, DOWN, IDLE,
  IDLE_UP, IDLE_DOWN, IDLE_LEFT, IDLE_RIGHT;
}