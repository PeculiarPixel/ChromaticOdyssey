class ComputationEngine {

  private ArrayList<Hitbox> hitboxes;
  private ArrayList<Trigger> triggers;
  private ArrayList<Trigger> activatedTriggers;
  private ArrayList<GameCharacter> players;
  private ArrayList<ComputationEvent> events;
  public int conversationIndex;
  private boolean runLevelPrompt = false;

  // Constructor
  public ComputationEngine() {
    
    this.events = new ArrayList<ComputationEvent>();
    this.hitboxes = new ArrayList<Hitbox>();
    this.triggers = new ArrayList<Trigger>();
    this.activatedTriggers = new ArrayList<Trigger>();
    this.players = new ArrayList<GameCharacter>();
    
  }
  
  // Add to hitboxes for Level
  public void addToHitboxes(Hitbox h) {
    this.hitboxes.add(h);
  }
  
  // Add To Triggers For Level
  public void addTrigger(Trigger t) {
    this.triggers.add(t);
  }
  
  
  // Add To Characters for Level
  public void addCharacter(GameCharacter c) {
    this.players.add(c);
  }

void run(){
  
  // Loop through all registered computation events //<>//
  for(ComputationEvent e : events) {
      e.send(); //<>// //<>// //<>//
      print("Computed Event\n");
  }
  
  clearEvents();
  
  moveWorld();  //probably want to move world before character, bc moveCharacter calculates hitboxes, want to check new ones not old ones.
  moveCharacter(5.0); //input is movespeed

}

  // Clears computation engine events
  public void clearEvents() {  
    this.events.clear();
  }
  
  
  public void clearEngine() {
    clearEvents();
    this.hitboxes.clear();
    this.triggers.clear();
    this.players.clear();
  }

  // Calculate intersections between area boxes (Hitboxes, Triggers)
  private void computeIntersection(Area hBox1, Area hBox2, float xChange, float yChange){
  
      if((hBox1.yPos + hBox1.getHeight()/2 >= hBox2.yPos - hBox2.getHeight()/2 &&
    hBox1.yPos - hBox1.getHeight()/2 <= hBox2.yPos + hBox2.getHeight()/2) &&
    (hBox1.xPos + hBox1.getWidth()/2 >= hBox2.xPos - hBox2.getWidth()/2 + xChange &&
    hBox1.xPos - hBox1.getWidth()/2 <= hBox2.xPos + hBox2.getWidth()/2 + xChange)) {

          
        if( hBox1.getDesignation() != AreaTypeEnum.CHARACTER_HITBOX ) {
          
          hBox2.setHitX(true);    //character
          hBox1.setHitX(true);    //box checking
          
        }
        
        runLevelPrompt = true;
        
      }
    else {
      
      hBox2.setHitX(false);
      hBox2.setHitX(false);
      
      runLevelPrompt = false;
      
    }
  
    if((hBox1.xPos + hBox1.getWidth()/2 >= hBox2.xPos - hBox2.getWidth()/2 &&
    hBox1.xPos - hBox1.getWidth()/2 <= hBox2.xPos + hBox2.getWidth()/2) &&
    (hBox1.yPos + hBox1.getHeight()/2 >= hBox2.yPos - hBox2.getHeight()/2 + yChange &&
    hBox1.yPos - hBox1.getHeight()/2 <= hBox2.yPos + hBox2.getHeight()/2 + yChange)) {
            
          if ( hBox1.getDesignation() != AreaTypeEnum.CHARACTER_HITBOX ) {
            
            hBox2.setHitY(true);
            hBox1.setHitY(true);
            
          }
          
          runLevelPrompt = true;
          
      }
    else {
      
      hBox2.setHitY(false);
      hBox1.setHitY(false);
      
      runLevelPrompt = false;
      
    }
 
  }
 

//void runLevelPrompt(){
//  println("Enter the castle?");
//  if(keyCode == ENTER) {
//    println("Entering the castle");
//    dispatcher.dispatch(new StateEvent(state.currentState.nextState())); //<>//
//    runLevelPrompt = false;
//  } //<>// //<>//
//}

  private void computeColorCheck(GameCharacter c, int xChange, int yChange){
    color pixelColor = state.currentState.hitboxImage.get( (int) c.local.getFeetX() + xChange, (int) c.local.getFeetY() + yChange);
    //println("COLOR="+red(pixelColor)+"<r:"+green(pixelColor)+"<g:"+blue(pixelColor)+"<b:");
      if(red(pixelColor) == 255){
         c.getHitbox().isHitX = true;
         c.getHitbox().isHitY = true;
      }else{
         c.getHitbox().isHitX = false;
         c.getHitbox().isHitY = false;
      }
  }

 private void moveCheck(float xChange, float yChange) { //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0] //<>// //<>//
    for (GameCharacter c : players ) {
       //<>// //<>//
      // Collision for triggers
      for (Area a : triggers) {  
        computeIntersection(a, c.getHitbox(), xChange, yChange);
      }
      
      for (Trigger t : triggers) {
        if (t.isHit() && !t.hasActivated()) {
          t.trigger();
        }
      }
     
      // Collision for hitboxes
      for (Area a : hitboxes) { //<>//
        
        computeIntersection(a, c.getHitbox(), xChange, yChange); //<>// //<>// //<>//
        
        if (c.local.hitbox.isHitX) xChange = 0; //<>// //<>//
        if (c.local.hitbox.isHitY) yChange = 0;
        
      }
      
    }
    
    
    for (GameCharacter c : players) {
      // Compute color change
      computeColorCheck( c, (int) xChange, (int) yChange );
    }    
    
    // Stop character movement again for color
    for (GameCharacter c : players) {
      if(c.local.hitbox.isHitX) xChange = 0;
      if(c.local.hitbox.isHitY) yChange = 0;
    }
    
    //for(int i = 0; i < hitboxes.size(); i++) {
    //  computeIntersection(hitboxes.get(i), players.get(0).getHitbox(), xChange, yChange); //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
    //  //computeColorCheck((int)xChange,(int)yChange);
    //  if(players.get(0).local.hitbox.isHitX) //<>// //<>//
    //    xChange = 0;
    //  if(players.get(0).local.hitbox.isHitY)
    //    yChange = 0;
    //} //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
    
    for (GameCharacter c : players) { //<>// //<>//
      
      c.moveX(xChange);
      c.moveY(yChange);
      
      c.setHitboxXPos(c.getXPos());
      c.setHitboxYPos(c.getYPos());
    
    }
     //<>//
  } 
 //<>// //<>//

  void moveCharacter(float speed) {
    
    if (newt.local.isMoving()) { //<>//
      if(newt.local.moveUp) {
        moveCheck(0.0,-speed); //<>// //<>//
      }
      if(newt.local.moveDown){
        moveCheck(0.0,speed);
      }
      if(newt.local.moveLeft){
        moveCheck(-speed,0.0);
      }
      if(newt.local.moveRight){
        moveCheck(speed,0.0);
      }
    }
    
    
  }
  
  
  
  
  
  //public void setWorld(px, py, saveX, saveY) {
  
  //}
  
  
  //private void clampCameraToWorld() {
    
  //  // Current level size
  //  LevelSize current = state.getCurrentStateSize();
    
  //  // Screen sizes
  //  float aspect = width / height;
    
  //  // Min / Max clamp positions
  //  float minX, maxX, minY, maxY;
    
  //  minX = width - current.w / 2.0;
  //  maxX = current.w / 2.0 - width;
  //  minY = height - current.h / 2.0;
  //  maxY = current.h / 2.0 - height;
    
  // px = clamp(px, minX, maxX);
  // py = clamp(py, minY, maxY);
    
  //}
  
  // Move world calculates the translation factor that you will move the background based on character movement
  public void moveWorld() {
    
    px += (saveX - newt.getXPos());
    py += (saveY - newt.getYPos());
    saveX = newt.getXPos();
    saveY = newt.getYPos();
    
    //clampCameraToWorld();
    
  } 
  
}