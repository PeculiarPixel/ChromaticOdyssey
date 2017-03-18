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
                            global.sprite.width, global.sprite.height, 
                             100, 0, 100);
    }
    
    // Set character move direction
    void setDirection(MoveDirection direction) {
      if (isDirectionChange(direction)) updateSprite(direction);
      local.setDirection(direction);
    }
    
    // Release character move direction
    void releaseDirection(MoveDirection direction) {
      if (local.releaseDirection(direction)) updateSprite(MoveDirection.IDLE);
    }
    
    boolean isDirectionChange(MoveDirection direction) {
      return local.isDirectionChange(direction);
    }
    
    boolean isMoving() {
      if (local.isMoving()) return true;
      return false;
    }
    
    void updateSprite(MoveDirection direction) {
      global.updateSpriteDirection(direction);
    }
    
}

// Characters identifiers
enum GameCharacterName {
  NEWT, KIT, MYTHRA, RUSS, FAISAL, PRAGMA, KNIGHT;
}