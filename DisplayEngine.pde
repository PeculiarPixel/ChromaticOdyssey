class DisplayEngine {
  
   ArrayList<DisplayableEvent> events = new ArrayList<DisplayableEvent>();

    void displayHitbox(Hitbox hit){
    fill(255,255,255);
    stroke(10);  
    fill(hit.showColor, 100);
    rectMode(CENTER);
    rect(hit.xPos, hit.yPos, hit.hitWidth, hit.hitHeight);
  }
  
  void displayDialog(Dialog talk){                                                                    //displays the dialog on the screen
    fill(255,255,255);
    stroke(20);  
    fill(155,155,155);
    rectMode(CENTER);
    rect(width/2,height-100,width,height/4);
    textSize(36);
    fill(0,0,0);
    text(talk.script.get(talk.currentLine),100,height-150);                                            //show static message
    
    //animation for text//

     if(frameCount%3==0 && saveSpot<talk.script.get(talk.currentLine).length()){                        //check for frame skips and if the current line has finished typing
      displayText += talk.script.get(talk.currentLine).charAt(saveSpot);                                //add the next character to the display text
      text(displayText,100,height-100);                                                                 //display the text
      saveSpot++;                                                                                       //set index to the next character of the current conversation line
    }else{
      text(displayText,100,height-100);                                                                 //wait until the character presses next to continue
    }
    
  }
  
  
  
  void displayCharacter(GameCharacter guy){
    
    imageMode(CENTER);
    
    guy.updateSpriteAnimation();
    image(guy.getCurrentImage(), guy.getXPos(), guy.getYPos());
    
    if(guy.local.hitboxDisplay){
      displayHitbox(guy.getHitbox());
    }
  }
    void displayLandscape(Landscape land){
    imageMode(CENTER);
    if(newt.local.hitboxDisplay){
      displayHitbox(land.hitboxes.get(0));
    }
  }
  
  
  // Run display engine
  void run() {
    
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
    if(hitBoxMode) {
    newt.local.hitboxDisplay = true;

  }
    if(dialog){
      //print("enter has been pressed");
     displayDialog(state.currentState.conversations.get(comp.conversationIndex));
    }
    
  }
  

    DisplayEngine(){
      //state = new Test_Level_0(newt);
      //currentState = state;
    }

}