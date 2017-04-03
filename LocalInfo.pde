// Local information for each character
class LocalInfo {

  private float xPos;  // Current position X
  private float yPos;  // Current position Y
 
  // Movement handlers
  private boolean moveUp = false;
  private boolean moveDown = false;
  private boolean moveLeft = false;
  private boolean moveRight = false;
  
  private MoveDirection direction;
  private MoveDirection secondaryDirection;
  
  private boolean hitboxDisplay;
  private CharacterHitbox hitbox;

  // Stats values
  private int currHealth;
  private int currExperience;
  private int currMana;
  
  // Constructor
  public LocalInfo(float x, float y, float sizeX, float sizeY, int h, int e, int m) {
    
    this.xPos = x;
    this.yPos = y;
    this.currHealth = h;
    this.currExperience = e;
    this.currMana = m;
    this.hitbox = new CharacterHitbox(x,  y, sizeX, sizeY);
    this.direction = MoveDirection.IDLE_DOWN;
    
  }
    
    
    // Set character local direction
    public void setDirection(MoveDirection direction) {
      
      // Change direction only if direction is new
      if (isDirectionChange(direction)) {
       
        addDirection(direction);
        
        switch(direction) {
          case LEFT:
            this.moveLeft = true;
            break;
          case RIGHT:
            this.moveRight = true;
            break;
          case UP:
            this.moveUp = true;
            break;
          case DOWN:
           this.moveDown = true;
           break;
        }
        
        // Log direction
        println("Current direction: " + this.direction.toString());
        
      }
        
         
    }
    
    // Add either new direction or new secondary direction
    private void addDirection(MoveDirection direction) {
      
      if(isMoving()) {
        this.secondaryDirection = this.direction;
        this.direction = direction;
      }
      else this.direction = direction;
      
    }
    
    // Release direction and move to either the secondary direction or idle
    private void releaseDirectionMoving(MoveDirection direction) {    
      if (direction != this.secondaryDirection) this.direction = this.secondaryDirection;       
    }
   
    
    // Check that we have not put in more than two movement keys
    public boolean checkTwoMoveKeyLimit() {
      
      // Initialize check
      int check = 0;
      
      // Test current movement directions
      if (this.moveUp) check++;
      if (this.moveDown) check++;
      if (this.moveLeft) check++;
      if (this.moveRight) check++;
      
      return (check > 1) ? true : false;
      
    }
   
    // Release all directions
    private void releaseDirections() {
      this.moveUp = false;
      this.moveDown = false;
      this.moveLeft = false;
      this.moveRight = false;
    }
    
    // Release movement direction
    public boolean releaseDirection(MoveDirection direction) {
      
      MoveDirection releaseDirection;
        
      switch(direction) {
          case LEFT:
            moveLeft = false;
            releaseDirection = MoveDirection.LEFT;
            break;
          case RIGHT:
            moveRight = false;
            releaseDirection = MoveDirection.RIGHT;
            break;
          case UP:
            moveUp = false;
            releaseDirection = MoveDirection.UP;
            break;
          case DOWN:
           moveDown = false;
           releaseDirection = MoveDirection.DOWN;
           break;
           default:
             releaseDirection = MoveDirection.DOWN;
        }    
        
        println("Releasing direction: " + releaseDirection);
        
      
        if (!isMoving()) {
          
          switch(releaseDirection) {
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
        
        if (isMoving()) { 
            releaseDirectionMoving(releaseDirection);
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
    
    //Get X Position of the character's feet, not character center
    public float getFeetX(){return this.xPos;}
    
    //Get X Position of the character's feet, not character center
    public float getFeetY(){return this.yPos+this.hitbox.getHeight()/2;}
    
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