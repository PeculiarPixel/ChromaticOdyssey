class GameCharacter{
  
  private GlobalInfo global;
  private LocalInfo local;
  private GameCharacterName name;
   
    // Constructor
    GameCharacter(GameCharacterName name) {
      
      // Character's identifier
      this.name = name;
      
      // Load characters required animations
      ArrayList<SpriteAnimation> animations = spriteLibrary.getCharacterAnimations(name);
      
      // Global info
      global = new GlobalInfo(100, 0, 100, animations);
      
      // Local info
      local = new LocalInfo(width/2, height/2, 
                            getCurrentImage().width, getCurrentImage().height, 
                             100, 0, 100);
    }
    
    // Set character move direction
    void setDirection(MoveDirection direction) {
      if (isDirectionChange(direction)) updateSprite(direction);
      local.setDirection(direction);
    }
    
    // Release character move direction
    void releaseDirection(MoveDirection direction) {
      if (local.releaseDirection(direction)) updateSprite(local.getDirection());
    }
    
    // Test if move was change in direction
    boolean isDirectionChange(MoveDirection direction) {
      return local.isDirectionChange(direction);
    }
    
    // Test is character is moving
    boolean isMoving() {
      if (local.isMoving()) return true;
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
    
}

// Characters identifiers
enum GameCharacterName {
  NEWT, KIT, MYTHRA, RUSS, FAISAL, PRAGMA, KNIGHT;
}