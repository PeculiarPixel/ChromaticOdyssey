class ComputationEngine{ //will extend this class into different landscapes if needed

ArrayList<Hitbox> hitboxes;
ArrayList<PlayerCharacter> players;
ArrayList<ComputationEvent> computationEvents = new ArrayList<ComputationEvent>();

void run(){
  moveCharacter(5.0);
}

void clear(){  //clears the computation engine when a new state is declared
  hitboxes.clear();
  computationEvents.clear();
  PlayerCharacter temp = players.get(0);
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
    state.events.add(new StateEvent(state.currentState.nextState()));
  }



}

 void moveCheck(float xChange, float yChange){ //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0]
    for(int i = 0; i < hitboxes.size(); i++){
      computeIntersection(hitboxes.get(i), players.get(0).local.hitbox,xChange,yChange);
      if(players.get(0).local.hitbox.isHitX)
        xChange = 0;
      if(players.get(0).local.hitbox.isHitY)
        yChange = 0;
    }

    players.get(0).local.xPos += xChange;
    players.get(0).local.yPos += yChange;

    players.get(0).local.hitbox.xPos= players.get(0).local.xPos;
    players.get(0).local.hitbox.yPos= players.get(0).local.yPos;
  } 


  void moveCharacter(float speed){ //<>//
    
    if(players.get(0).local.moveUp){ //<>//
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

  // Constructor
  ComputationEngine() {
    hitboxes = new ArrayList<Hitbox>();
    players = new ArrayList<PlayerCharacter>();
  }
  
}