/*  Display Engine
*   Draw received events in game
*/
class DisplayEngine {
  
   // Displayable events
   ArrayList<DisplayableEvent> events;
   Script currentScript;
   
   //State Transition in progress
   boolean transition;
   //State Transition Event copy
   StateEvent transitionEvent;
   //values to control the fade
   int alpha;
   int theta;
   float transitionFade;
   Fog transitionFog;
   
   // Constructor
   public DisplayEngine() {
     this.events = new ArrayList<DisplayableEvent>();
     transition = false;
     alpha=0;
     theta = 255;
     transitionFade = 0;
     transitionFog = new Fog(width/2,height/2,5);
   }

  // Display hitboxes
  public void displayArea(Area hit) {
    fill(255,255,255);
    stroke(10);  
    fill(hit.showColor, 100);
    rectMode(CENTER);
    rect(hit.xPos, hit.yPos, hit.getWidth(), hit.getHeight());
    
  }
  
  // Display dialog
  void displayDialog(Dialog talk) {
    
    //// Set dialog window details
    //fill(255,255,255);
    //stroke(20);  
    //fill(155,155,155);
    //rectMode(CENTER);
    //rect(width/2, height-100, width, height/4);
    //textSize(36);
    //fill(0,0,0);
    
    // // Animate Dialog Text
    // if( frameCount % 3 == 0 
    //     && saveSpot <  ) {          // Check for frame skips and if the current line has finished typing
         
    //  displayText += talk.script.get(talk.currentLine).charAt(saveSpot);       // Add the next character to the display text
    //  text(displayText,100,height-100);                                        // Display the text
    //  saveSpot++;                                                              // Set index to the next character of the current conversation line
      
    //} else {                                                                   // Display the txt until player presses next
      
    //  text(displayText,100,height-100);                                        // Wait until the character presses next to continue
      
    //}
    
  }


void strokeText(String message, float x, float y, int size, int fade){ 
  textSize(size);
  fill(255,255,255,fade); 
  text(message, x-2, y); 
  text(message, x, y-2); 
  text(message, x+2, y); 
  text(message, x, y+2); 
  fill(0,0,0,fade); 
  text(message, x, y);
} 

void fadeOut(){
  fill(104,50,104,alpha);
  rect(0,0,1000,1000);
  strokeText("FUK U",width/2,height/2,48,alpha);
  alpha+=5;
  if(transitionFade<255){
  transitionFade = alpha+5;
  }else{
    transitionFade = 255;
  }
  }
 void fadeIn(){
  fill(104,50,104,theta);
  rect(0,0,1000,1000);
  strokeText("FUK U",width/2,height/2,48,theta);
  theta-=5;
  if(transitionFade>0){
  transitionFade = theta-5;
  }else{
  transitionFade =0;
  }
} 
  // Display game characters
  public void displayCharacter(GameCharacter c) {
    
    imageMode(CENTER);
    c.updateSpriteAnimation(); //<>// //<>//
    image(c.getCurrentImage(), c.getXPos(), c.getYPos()); //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
     //<>// //<>//
    if(c.local.hitboxDisplay){
      displayArea(c.getHitbox());
    }
    
  }
  
  // Display Landscapes
  public void displayLandscape(Landscape land){
    imageMode(CENTER);
    if(newt.local.hitboxDisplay){
      displayArea(land.hitboxes.get(0));
    }
  }
  
  // Display all characters in state's current level
  private void displayCharacters() {
    imageMode(CORNER);
    for (GameCharacter c : state.currentState.characters) {
      displayCharacter(c);
    }
  }
  
  // Display all landscapes in state's current level
  private void displayLandscapes() {
    for (Landscape l : state.currentState.landscapes) {
      displayLandscape(l);
    }
  }
  
  private void displayTriggers() {
    for (Trigger t : state.currentState.triggers) {
      if (newt.local.hitboxDisplay) {
        displayArea(t);
      }
    }
  }
  
  
  private void displayDialog() {
    
  }
  
  
  // Clear Display Engine of Events
  public void clearEvents() { //<>//
    this.events.clear(); //<>// //<>// //<>//
  } //<>// //<>//
  
  public void clearEngine() {
    clearEvents();
  }
  
  public void nextDialogLine() {
    
  }
  
  public Script getCurrentScript() {
   return null;
  }

  // Run display engine
  void run() {
    
   background(0);      //  Init background
   
   camera.fixedUpdate(); // Update camera positions
   
   pushMatrix();       //  In order to move the world around the character you must translate the frame of reference when you display everything
   translate(px, py);  //  Perform that translate
   
    // Draw background layer
    imageMode(CORNER);
    image(state.currentState.backgroundImage, 0, 0);
    
    // Display characters
    displayCharacters();
    
    // Draw foreground
    imageMode(CORNER);
    image(state.currentState.foregroundImage, 0, 0); 
    
    //imageMode(CENTER);
    // Draws castle enter prompt
    //if(comp.runLevelPrompt){
      //image(state.currentState.enterCastlePrompt,newt.getXPos()-200,newt.getYPos()-100); 
    //}
    
    // Display landscapes
    displayLandscapes();
    displayTriggers();
    

    state.currentState.fog.run(-1);

    // Pop translate matrix
    popMatrix(); 
  
    newt.local.hitboxDisplay = hitBoxMode;
  
    if(dialog){
      //print("enter has been pressed");
      //displayDialog(state.currentState.conversations.get(comp.conversationIndex));
    }
        
    if(transition){
          //  transitionFog.run(transitionFade);
      if(alpha<255){
        fadeOut();
      }else if(alpha==255){
        transitionEvent.send();
        fadeIn();
      }
   
      if(theta ==0){
        theta = 255;
        transition = false;
        alpha =0;
        transitionFade=0;
      }
      

    }
  }

}