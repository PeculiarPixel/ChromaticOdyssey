class GameCharacter{
  
  private GlobalInfo global;
  private LocalInfo local;
   
    // Constructor
    GameCharacter() {
      
      // Global info
      global = new GlobalInfo(100, 0, 100);
      
      // Local info
      local = new LocalInfo(width/2, height/2, 
                            global.sprite.width, global.sprite.height, 
                             100, 0, 100);
    }
    
    // Set character move direction
    void setDirection(MoveDirection direction) {
      local.setDirection(direction);
    }
    
    // Release character move direction
    void releaseDirection(MoveDirection direction) {
      local.releaseDirection(direction);
    }
    
}