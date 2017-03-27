class ComputationEngine{ //will extend this class into different landscapes if needed

ArrayList<Hitbox> hitboxes;
ArrayList<GameCharacter> players;
ArrayList<ComputationEvent> events = new ArrayList<ComputationEvent>();
int conversationIndex;
boolean runLevelPrompt = false;

void run(){

  // Loop through all registered computation events
  for(ComputationEvent e : events) {
    if(e.type == "ComputationEvent") { 
      //print("Character health reduced from " +  e.target.local.currHealth);
      e.target.local.currHealth += e.value;
      //print(" to " + e.target.local.currHealth + "\n");
    }
  }
  events.clear();
  moveWorld();  //probably want to move world before character, bc moveCharacter calculates hitboxes, want to check new ones not old ones.
  moveCharacter(5.0); //input is movespeed
  
  if(runLevelPrompt){   
    runLevelPrompt();
  }

}

void clear() {  //clears the computation engine when a new state is declared
  
  hitboxes.clear();
  events.clear();
  GameCharacter temp = players.get(0);
  players.clear();
  players.add(temp);
  
}




void computeIntersection(Hitbox hBox1, Hitbox hBox2, float xChange, float yChange){

 
  
  if((hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2) &&
    (hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 + xChange &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2 + xChange))
    {
      if(hBox1.designation != "EventBox"){
        hBox2.isHitX=true;    //character
        hBox1.isHitX=true;    //box checking 
      }
      runLevelPrompt = true;
    }
  else{
    hBox2.isHitX=false;
    hBox2.isHitX=false;
    runLevelPrompt = false;
  }

  if((hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2) &&
    (hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 + yChange &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2 + yChange))
      {
        if(hBox1.designation != "EventBox"){
          hBox2.isHitY=true;
          hBox1.isHitY=true;
        }
        runLevelPrompt = true;
    }
  else{
    hBox2.isHitY=false;
    hBox1.isHitY=false;
    runLevelPrompt = false;
  }

  //if(hBox1.designation =="EventBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this check to see if the hitbox being intersected is an "EventBox", or one that triggers a switch
    
  //}
  
  if(hBox1.designation =="DamageBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this to test computable event
    dispatcher.dispatch(new ComputationEvent(-10,newt));
  }
  if(hBox1.designation =="DialogBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this to test dialog
    dialog = true;  
    hBox1.isHitX = false;
    hBox1.isHitY = false;
    conversationIndex = hBox1.conversationIndex;
  }
}

 //<>// //<>// //<>//
 
void runLevelPrompt(){
  println("Enter the castle?");
  if(keyCode == ENTER) {
    println("Entering the castle");
    dispatcher.dispatch(new StateEvent(state.currentState.nextState()));
    runLevelPrompt = false;
  }
}

void computeColorCheck(int xChange, int yChange){
  color pixelColor = state.currentState.hitboxImage.get((int)newt.local.getFeetX()+xChange,(int)newt.local.getFeetY()+yChange);
  println("COLOR="+red(pixelColor)+"<r:"+green(pixelColor)+"<g:"+blue(pixelColor)+"<b:");
    if(red(pixelColor) == 255){
       newt.getHitbox().isHitX = true;
       newt.getHitbox().isHitY = true;
    }else{
       newt.getHitbox().isHitX = false;
       newt.getHitbox().isHitY = false;
    }
}


 void moveCheck(float xChange, float yChange) { //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0]
    
    
    for(int i = 0; i < hitboxes.size(); i++) {
      computeIntersection(hitboxes.get(i), players.get(0).getHitbox(),xChange,yChange);
      //computeColorCheck((int)xChange,(int)yChange);
      if(players.get(0).local.hitbox.isHitX)
        xChange = 0;
      if(players.get(0).local.hitbox.isHitY) //<>//
        yChange = 0;
    } //<>//

    computeColorCheck((int)xChange,(int)yChange);
    if(players.get(0).local.hitbox.isHitX) //<>//
        xChange = 0;
    if(players.get(0).local.hitbox.isHitY)
        yChange = 0;

    players.get(0).moveX(xChange);
    players.get(0).moveY(yChange);

    players.get(0).setHitboxXPos(players.get(0).getXPos());
    players.get(0).setHitboxYPos(players.get(0).getYPos()); //<>// //<>//
  } 
 //<>// //<>//


  void moveCharacter(float speed) {
    //<>//
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
  
  
  
  
  
//Move world calculates the translation factor that you will move the background based on character movement
  void moveWorld(){

    px = px + (saveX-newt.getXPos());
    py = py + (saveY-newt.getYPos());

  saveX = newt.getXPos();
  saveY = newt.getYPos();
  } 

 void updateDialog(){            //Nathan- Partially implemented dialog test.  Works for one conversation, need to update to pull conversations from file, and when to trigger conversations
      if(dialog==false){
        //dialog = true;   // make the window appear
        println("dialog is false");
      }else{
        println("dialog is true");
        if(state.currentState.conversations.get(conversationIndex).currentLine < state.currentState.conversations.get(conversationIndex).script.size()-1){ //you press enter to go to the next line of conversation
           saveSpot =0;
           displayText="";
           state.currentState.conversations.get(conversationIndex).currentLine++;  //go to next line of conversation

        }else{
          //reset or go to next conversation.  right now it resets the conversation and removes the conversation bar.
           saveSpot =0;
           displayText="";
           state.currentState.conversations.get(conversationIndex).currentLine=0;  //start conversation over
           dialog = false; //remove the dialog window
        }
      }
}


  // Constructor
  ComputationEngine() {
    hitboxes = new ArrayList<Hitbox>();
    players = new ArrayList<GameCharacter>();
  }
  
}