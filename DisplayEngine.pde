class DisplayEngine {
  
   ArrayList<DisplayableEvent> events = new ArrayList<DisplayableEvent>();

    void displayHitbox(Hitbox hit){
    fill(255,255,255);
    stroke(10);  
    fill(hit.showColor, 100);
    rectMode(CENTER);
    rect(hit.xPos, hit.yPos, hit.hitWidth, hit.hitHeight);
  }
  
  void displayCharacter(GameCharacter guy){
    
    imageMode(CENTER);
   
    image(guy.global.sprite,guy.local.xPos,guy.local.yPos);
    if(guy.local.hitboxDisplay){
      displayHitbox(guy.local.hitbox);
    }
  }
    void displayLandscape(Landscape land){
    imageMode(CENTER);
    if(newt.local.hitboxDisplay){
      displayHitbox(land.hitboxes.get(0));
    }
  }
  
  
  
  void run(){
    
   background(0);

   pushMatrix();            //in order to move the world around the character you must translate the frame of reference when you display everything
   translate(px, py);
   
   

    Landscape tempLand;
    for(int i=0; i <state.currentState.landscapes.size();i++){
      tempLand = state.currentState.landscapes.get(i);
      displayLandscape(tempLand);
    }  

    
    GameCharacter tempChar;
    for(int i=0; i <state.currentState.characters.size();i++){
      tempChar = state.currentState.characters.get(i);
      displayCharacter(tempChar);
    }     
    popMatrix(); 
    if(hitBoxMode){
    newt.local.hitboxDisplay = true;
    
    // test displaying loaded sprites
    image(newtWalk.sprites[0], 50, 50);
    image(newtWalk.sprites[1], 150, 50);
    image(newtIdle.sprites[0], 50, 160);
    image(newtIdle.sprites[1], 150, 160);

  }
    
    
  }
  

    DisplayEngine(){
      //state = new Test_Level_0(newt);
      //currentState = state;
    }

}