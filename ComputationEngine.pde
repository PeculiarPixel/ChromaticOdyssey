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
  

void run() { //<>// //<>// //<>//
  
  // Loop through all registered computation events //<>// //<>// //<>// //<>// //<>//
  if(mousePressed == true && state.currentState.name == LevelName.INTRO) {
    if(mouseX > 511 && mouseX < 827 && mouseY > 385 && mouseY < 552){
      introScreen.stop();
      dispatcher.dispatch(new LevelTransitionEvent(LevelName.CASTLE_APPROACH));
    }
  }

  // Loop through all registered computation events
  for(ComputationEvent e : events) {
      e.send(); //<>// //<>// //<>// //<>// //<>//
      if (DEBUG.COMPUTATION_LOGGING) print("Computed Event\n");
  }
  
  MoveDirection copy = newt.local.getDirection();
  if (DEBUG.MOVE_LOGGING) println("direction:"+copy);
  kitMoveSet.add(copy);
  
  clearEvents();
  //kitRelease();//move this after move Kit?
  moveCharacter(5.0); //input is movespeed
  if(!kitMoveSet.isEmpty()){
  if (DEBUG.MOVE_LOGGING) println("Kit move>", kitMoveSet.get(0));
}
  moveKit(5.0);
  kitMoveRelease.add(MoveDirection.JUNK);
  kitRelease();

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
       //<>//
      runLevelPrompt = false;
      
    }
  
    if((hBox1.xPos + hBox1.getWidth()/2 >= hBox2.xPos - hBox2.getWidth()/2 &&
    hBox1.xPos - hBox1.getWidth()/2 <= hBox2.xPos + hBox2.getWidth()/2) &&
    (hBox1.yPos + hBox1.getHeight()/2 >= hBox2.yPos - hBox2.getHeight()/2 + yChange &&
    hBox1.yPos - hBox1.getHeight()/2 <= hBox2.yPos + hBox2.getHeight()/2 + yChange)) { //<>//
            
          if ( hBox1.getDesignation() != AreaTypeEnum.CHARACTER_HITBOX ) { //<>//
            
            hBox2.setHitY(true);
            hBox1.setHitY(true);
            
          }
          
          runLevelPrompt = true;
           //<>//
      }
    else { //<>//
      
      hBox2.setHitY(false);
      hBox1.setHitY(false);
       //<>//
      runLevelPrompt = false;
      
    } //<>//
  //<>// //<>//
  } //<>// //<>// //<>//

  private void computeColorCheck(GameCharacter c, int xChange, int yChange){ //<>//
    color pixelColor = state.currentState.hitboxImage.get( (int) c.local.getFeetX() + xChange, (int) c.local.getFeetY() + yChange); //<>//
    //println("COLOR="+red(pixelColor)+"<r:"+green(pixelColor)+"<g:"+blue(pixelColor)+"<b:");
      if(red(pixelColor) == 255){ //<>//
         c.getHitbox().isHitX = true; //<>// //<>//
         c.getHitbox().isHitY = true; //<>// //<>// //<>//
      }else{ //<>//
         c.getHitbox().isHitX = false; //<>// //<>//
         c.getHitbox().isHitY = false;
      }
  }
 //<>//

 private void moveCheck(float xChange, float yChange, GameCharacter character) { 
    //<>//
  //  for (GameCharacter c : players ) { //<>//
      // Collision for triggers //<>//
      for (Area a : triggers) {  
        computeIntersection(a, character.getHitbox(), xChange, yChange); //<>//
      } //<>//
       //<>//
      for (Trigger t : triggers) {
        if (t.isHit() && !t.hasActivated()) { //<>//
          t.trigger(); //<>//
        } //<>// //<>//
      } //<>//
     
      // Collision for hitboxes  //<>//
      for (Area a : hitboxes) { //<>// //<>//
         //<>//
        computeIntersection(a, character.getHitbox(), xChange, yChange);  //<>//
         //<>//
        if (character.local.hitbox.isHitX) xChange = 0;  //<>//
        if (character.local.hitbox.isHitY) yChange = 0;
      
      }
       //<>//
   // } //<>//
   
      // Compute color change //<>//
      computeColorCheck( character, (int) xChange, (int) yChange ); //<>//
       //<>//
    
      // Stop character movement again for color
      if(character.local.hitbox.isHitX) xChange = 0; //<>//
      if(character.local.hitbox.isHitY) yChange = 0; //<>//
      
      character.moveX(xChange);
      character.moveY(yChange);
      
      character.setHitboxXPos(character.getXPos());
      character.setHitboxYPos(character.getYPos());
    
  }  
   //<>//
  void moveCharacter(float speed) { // this is really moveNewt //<>//
    
    if (newt.local.isMoving()) {
      if(newt.local.moveUp) { //<>//
        moveCheck(0.0,-speed, newt); //<>//
      } //<>// //<>//
      if(newt.local.moveDown){ //<>//
        moveCheck(0.0,speed, newt);
      }
      if(newt.local.moveLeft){ //<>//
        moveCheck(-speed,0.0,newt); //<>//
      }
      if(newt.local.moveRight){
        moveCheck(speed,0.0,newt);
      }
    }
    
    
  } //<>//
   //<>//
    void moveKit(float speed) {  //this is really moveKit //<>//
    
    
    if(!kitMoveSet.isEmpty()){
      
      if(kitMoveSet.get(0) == MoveDirection.UP) {
        kit.setDirection(kitMoveSet.get(0));
        moveCheck(0.0,-speed, kit);
      }
      if(kitMoveSet.get(0) == MoveDirection.DOWN){
        kit.setDirection(kitMoveSet.get(0));
        moveCheck(0.0,speed, kit);
      }
      if(kitMoveSet.get(0) == MoveDirection.LEFT){
        kit.setDirection(kitMoveSet.get(0));
        moveCheck(-speed,0.0,kit);
      }
      if(kitMoveSet.get(0) == MoveDirection.RIGHT){
        kit.setDirection(kitMoveSet.get(0));
        moveCheck(speed,0.0,kit);
      }

      kitMoveSet.remove(0);
      //kit.setDirection(kitMoveSet.get(0));
    }
    
    
  /*      if(kitKeyPress){
    if (newt.local.isMoving()) { //<>// //<>//
      if(newt.local.moveUp) {
        kit.setDirection(MoveDirection.UP);
      println("pressing up");
        moveCheck(0.0,-speed, kit);
      }
      if(newt.local.moveDown){
        kit.setDirection(MoveDirection.DOWN);
        moveCheck(0.0,speed, kit);
      }
      if(newt.local.moveLeft){
        kit.setDirection(MoveDirection.LEFT);
        moveCheck(-speed,0.0,kit);
      }
      if(newt.local.moveRight){
        kit.setDirection(MoveDirection.RIGHT);
        moveCheck(speed,0.0,kit);
      }
    }
    
        }*/
     //<>//
  }
  
  void kitRelease(){
    //println("lets start the release");
    if(!kitMoveRelease.isEmpty()){
              //println("inside if check");
        if(kitMoveRelease.get(0)!=MoveDirection.JUNK){      
        kit.releaseDirection(kitMoveRelease.get(0));
        }
            //println("released");
        kitMoveRelease.remove(0);
                //println("removed the release from list");
    }
    

 /*   if(!kitKeyPress){
    if(kit.getDirection()== MoveDirection.RIGHT){
        kit.releaseDirection(MoveDirection.RIGHT);
    }else if(kit.getDirection()== MoveDirection.LEFT){
        kit.releaseDirection(MoveDirection.LEFT);
    }else if(kit.getDirection()== MoveDirection.UP){
            println("releasing up");
        kit.releaseDirection(MoveDirection.UP);
    }else if(kit.getDirection()== MoveDirection.DOWN){
        kit.releaseDirection(MoveDirection.DOWN);
    }  
    }*/
  
  
  }
  
}