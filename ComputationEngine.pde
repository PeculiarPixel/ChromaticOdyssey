class ComputationEngine{ //will extend this class into different landscapes if needed

ArrayList<Hitbox> hitboxes;
ArrayList<GameCharacter> players;
ArrayList<ComputationEvent> events = new ArrayList<ComputationEvent>();

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
  moveWorld();              //probably want to move world before character, bc moveCharacter calculates hitboxes, want to check new ones not old ones.
  moveCharacter(5.0); //input is movespeed


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
      hBox2.isHitX=true;
      hBox1.isHitX=true;            
    }
  else{
    hBox2.isHitX=false;
    hBox2.isHitX=false;
  }

  if((hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2) &&
    (hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 + yChange &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2 + yChange))
      {
      hBox2.isHitY=true;
      hBox1.isHitY=true;
    }
  else{
    hBox2.isHitY=false;
    hBox1.isHitY=false;
  }

  if(hBox1.designation =="EventBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this check to see if the hitbox being intersected is an "EventBox", or one that triggers a switch
    dispatcher.dispatch(new StateEvent(state.currentState.nextState()));
  }
  if(hBox1.designation =="DamageBox" && (hBox1.isHitX || hBox1.isHitY)){  // Nathan - I added this to test computable event
    dispatcher.dispatch(new ComputationEvent(-10,newt));
  }

}

 void moveCheck(float xChange, float yChange){ //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0]
    for(int i = 0; i < hitboxes.size(); i++){
      computeIntersection(hitboxes.get(i), players.get(0).local.hitbox,xChange,yChange);
      if(players.get(0).local.hitbox.isHitX)
        xChange = 0;
      if(players.get(0).local.hitbox.isHitY) //<>//
        yChange = 0;
    } //<>//

    players.get(0).local.xPos += xChange;
    players.get(0).local.yPos += yChange;

    players.get(0).local.hitbox.xPos= players.get(0).local.xPos;
    players.get(0).local.hitbox.yPos= players.get(0).local.yPos;
  } 


  void moveCharacter(float speed){ //<>// //<>//
    
    if(players.get(0).local.moveUp){ //<>// //<>//
      moveCheck(0.0,-speed);
    }
    if(players.get(0).local.moveDown){
      moveCheck(0.0,speed);
    }
    if(players.get(0).local.moveLeft){
      moveCheck(-speed,0.0);
    }
    if(players.get(0).local.moveRight){
      moveCheck(speed,0.0);
    }
  }
  
//Move world calculates the translation factor that you will move the background based on character movement
  void moveWorld(){
    px = px + (saveX-newt.local.xPos);
    py = py + (saveY-newt.local.yPos);

  /*if(newt.local.xPos<(3*(width/10))){      //fancier movement, may be inadvisable
      px = px + (saveX-newt.local.xPos)/2;
  }else if(newt.local.xPos>(6*(width/10))){
        px = px + (saveX-newt.local.xPos)/2;
  }else{
    px = px + (saveX-newt.local.xPos)/8;
  }
  if(newt.local.yPos<(3*(height/10))){
      py = py + (saveY-newt.local.yPos)/2;
  }else if(newt.local.yPos>(6*(height/10))){
        py = py + (saveY-newt.local.yPos)/2;
  }else{
     py = py + (saveY-newt.local.yPos)/8;
  }*/



  saveX = newt.local.xPos;
  saveY = newt.local.yPos;
  } 




  // Constructor
  ComputationEngine() {
    hitboxes = new ArrayList<Hitbox>();
    players = new ArrayList<GameCharacter>();
  }
  
}