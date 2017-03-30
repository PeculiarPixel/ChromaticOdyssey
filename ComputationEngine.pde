class ComputationEngine {

  private ArrayList<Hitbox> hitboxes;
  private ArrayList<Trigger> triggers;
  private ArrayList<Trigger> activatedTriggers;
  private ArrayList<GameCharacter> players;
  private ArrayList<ComputationEvent> events = new ArrayList<ComputationEvent>();
  public int conversationIndex;
  private boolean runLevelPrompt = false;

  // Constructor
  public ComputationEngine(GameCharacter Newt) {
    
    this.hitboxes = new ArrayList<Hitbox>();
    this.triggers = new ArrayList<Trigger>();
    this.activatedTriggers = new ArrayList<Trigger>();
    this.players = new ArrayList<GameCharacter>();
    
    this.players.add(Newt);
    
  }
  
  // Add to hitboxes for Level
  public void addToHitboxes(Hitbox h) {
    this.hitboxes.add(h);
  }
  
  // Add To Triggers For Level
  public void addTrigger(Trigger t) {
    this.triggers.add(t);
  }

void run(){

  // Loop through all registered computation events
  for(ComputationEvent e : events) {
      e.compute();
      print("Computed Event\n");
  }
  
  events.clear();
  moveWorld();  //probably want to move world before character, bc moveCharacter calculates hitboxes, want to check new ones not old ones.
  moveCharacter(5.0); //input is movespeed
  
  //if(runLevelPrompt){   
  //  runLevelPrompt();
  //}

}

void clear() {  //clears the computation engine when a new state is declared
  hitboxes.clear();
  triggers.clear();
  events.clear();
  GameCharacter temp = players.get(0);
  players.clear();
  players.add(temp);
}




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
  
    //if(hBox1.designation =="EventBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this check to see if the hitbox being intersected is an "EventBox", or one that triggers a switch
      
    //}
    
    //if(hBox1.designation == AreaTypeEnum.DAMAGE_HITBOX && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this to test computable event
    //  dispatcher.dispatch(new ComputationEvent(-10,newt)); //<>//
    //}
    //if(hBox1.designation == AreaTypeEnum.DIALOG_TRIGGER && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this to test dialog
    //  dialog = true;  
    //  hBox1.isHitX = false;
    //  hBox1.isHitY = false;
    //  conversationIndex = hBox1.conversationIndex;
    //}
  }
 

//void runLevelPrompt(){
//  println("Enter the castle?");
//  if(keyCode == ENTER) {
//    println("Entering the castle");
//    dispatcher.dispatch(new StateEvent(state.currentState.nextState()));
//    runLevelPrompt = false;
//  }
//}

  private void computeColorCheck(int xChange, int yChange){
    color pixelColor = state.currentState.hitboxImage.get( (int) newt.local.getFeetX() + xChange, (int) newt.local.getFeetY() + yChange);
    //println("COLOR="+red(pixelColor)+"<r:"+green(pixelColor)+"<g:"+blue(pixelColor)+"<b:");
      if(red(pixelColor) == 255){
         newt.getHitbox().isHitX = true;
         newt.getHitbox().isHitY = true;
      }else{
         newt.getHitbox().isHitX = false;
         newt.getHitbox().isHitY = false;
      }
  }

 //<>//
 private void moveCheck(float xChange, float yChange) { //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0]
     //<>//
    for (GameCharacter c : players ) {
      
      // Collision for triggers
      for (Area a : triggers) {  
        computeIntersection(a, c.getHitbox(), xChange, yChange);
      }
      
      for (Trigger t : triggers) {
        if (t.isHit()) {
          t.trigger();
          activatedTriggers.add(t);
        }
      }
      
      if ( !activatedTriggers.isEmpty() ) {
        for (Trigger t : activatedTriggers) {
          triggers.remove(t);
        }
        activatedTriggers.clear();  
      }
      
      // Collision for hitboxes
      for (Area a : hitboxes) {
        
        computeIntersection(a, c.getHitbox(), xChange, yChange);
        
        if (c.local.hitbox.isHitX) xChange = 0;
        if (c.local.hitbox.isHitY) yChange = 0;
        
      }
      
    }
    
    // Compute color change
    computeColorCheck( (int) xChange, (int) yChange );
    
    // Stop character movement again for color
   if(players.get(0).local.hitbox.isHitX)
        xChange = 0;
    if(players.get(0).local.hitbox.isHitY)
        yChange = 0;
    
    //for(int i = 0; i < hitboxes.size(); i++) {
    //  computeIntersection(hitboxes.get(i), players.get(0).getHitbox(), xChange, yChange); //<>//
    //  //computeColorCheck((int)xChange,(int)yChange);
    //  if(players.get(0).local.hitbox.isHitX)
    //    xChange = 0;
    //  if(players.get(0).local.hitbox.isHitY)
    //    yChange = 0;
    //} //<>//

    players.get(0).moveX(xChange);
    players.get(0).moveY(yChange);

    players.get(0).setHitboxXPos(players.get(0).getXPos());
    players.get(0).setHitboxYPos(players.get(0).getYPos());
    
  } 


  void moveCharacter(float speed) {
    
    GameCharacter newt = players.get(0);
    
    if (newt.local.isMoving()) {
      if(newt.local.moveUp) {
        moveCheck(0.0,-speed);
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
  
  
  // Move world calculates the translation factor that you will move the background based on character movement
  public void moveWorld() {

    px += (saveX - newt.getXPos());
    py += (saveY - newt.getYPos());
    saveX = newt.getXPos();
    saveY = newt.getYPos();
    
  } 

   public void updateDialog() {            //Nathan- Partially implemented dialog test.  Works for one conversation, need to update to pull conversations from file, and when to trigger conversations
   
      if (dialog == false) { 
        
        //dialog = true;   // make the window appear
        println("Currently No Dialog To Update\n");
        
      } else {
        
        println("Executing Dialog...");
        
        if (state.currentState.conversations.get(conversationIndex).currentLine 
              < state.currentState.conversations.get(conversationIndex).script.size() - 1) { //you press enter to go to the next line of conversation
              
           saveSpot = 0;
           displayText = "";
           
           state.currentState.conversations.get(conversationIndex).currentLine++;  //go to next line of conversation

        } else {
          
           // Reset Conversation, Remove Dialog Box
           saveSpot = 0;
           displayText = "";
           state.currentState.conversations.get(conversationIndex).currentLine = 0;           
           dialog = false;
           
        }
      }
}

  // Set the conversation index
  public void setConversationIndex(int conversationIndex) {
    this.conversationIndex = conversationIndex;
  }
  
}