class GameCharacter {
  
  private GlobalInfo global;
  private LocalInfo local;
  private GameCharacterName name;
   
    // Constructor
    public GameCharacter(GameCharacterName inputName) {
      
      // Character's identifier
      this.name = inputName;
      
      // Load characters required animations
      HashMap<String, SpriteAnimation> animations = spriteLibrary.getCharacterAnimations(name);
      
      // Global info
      global = new GlobalInfo(100, 100, animations);
      
      // Local info
      local = new LocalInfo(width/2, height/2, 
                            getCurrentImage().width, getCurrentImage().height, 
                             100, 0, 100);
    }
    
    // Set character move direction
    void setDirection(MoveDirection direction) {
      
      if (checkTwoMoveKeyLimit()) return;
      
      if (isDirectionChange(direction)) {
        this.local.setDirection(direction);
        updateSprite(local.getDirection());
      }
      
    }
    
    // Check that we have only up to two move keys pressed
    private boolean checkTwoMoveKeyLimit() {
      return this.local.checkTwoMoveKeyLimit();
    }
   
    
    // Release character move direction
    void releaseDirection(MoveDirection direction) {
      if (this.local.releaseDirection(direction)) updateSprite(this.local.getDirection());
    }
    
    // Test if move was change in direction
    boolean isDirectionChange(MoveDirection direction) {
      return this.local.isDirectionChange(direction);
    }
    
    // Test is character is moving
    boolean isMoving() {
      if (this.local.isMoving()) return true;
      return false;
    }
    
    // Update sprite animation
    public void updateSprite(MoveDirection direction) {
      global.updateSpriteDirection(direction);
    }
    
    // Update Sprite Animation
    public void updateSpriteAnimation() {
      this.global.updateAnimation();
    }
    
    // Get current image of current animation
    public PImage getCurrentImage() { return this.global.getCurrentAnimationImage(); }
    
    // Get current direction
    public MoveDirection getDirection() { return this.local.getDirection(); }
    
    // Move GameCharacter along Y axis
    public void moveY(float amount) {
      this.local.moveY(amount);
    }
    
    // Move GameCharacter along X axis
    public void moveX(float amount) {
      this.local.moveX(amount);
    } 
    
    // Get X Position of Character
    public float getXPos() { return this.local.getXPos(); }
    
    // Get Y Position of Character
    public float getYPos() { return this.local.getYPos(); }
    
    // Set X Position of Character
    public void setXPos(float pos) { this.local.setXPos(pos); }
    
    // Set Y Position of Character
    public void setYPos(float pos) { this.local.setYPos(pos); }
    
    // Get Character Hitbox X Position
    public float getHitboxXPos() { return this.local.getHitboxXPos(); }
    
    // Get Character Hitbox Y Position
    public float getHitboxYPos() { return this.local.getHitboxYPos(); }
    
    // Set Character Hitbox Y Position
    public void setHitboxXPos(float pos) { this.local.setHitboxXPos(pos); }
    
    // Set Character Hitbox Y Position
    public void setHitboxYPos(float pos) { this.local.setHitboxYPos(pos); }
    
    // Get Hitbox of Character
    public CharacterHitbox getHitbox() { return this.local.hitbox; }
    
    public void initialize() { comp.addCharacter(this); }
    
}