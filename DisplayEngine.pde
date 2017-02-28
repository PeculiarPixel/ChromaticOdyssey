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
    
    GameCharacter tempChar;
    for(int i=0; i <state.currentState.characters.size();i++){
      tempChar = state.currentState.characters.get(i);
      displayCharacter(tempChar);
    }  
    Landscape tempLand;
    for(int i=0; i <state.currentState.landscapes.size();i++){
      tempLand = state.currentState.landscapes.get(i);
      displayLandscape(tempLand);
    }     
   
    if(hitBoxMode){
    newt.local.hitboxDisplay = true;

  }
    
    
  }
  

    DisplayEngine(){
      //state = new Test_Level_0(newt);
      //currentState = state;
    }

}