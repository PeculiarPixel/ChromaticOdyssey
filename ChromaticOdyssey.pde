import processing.video.*;

void setup(){
  //gg boys
  surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
  surface.setResizable(false);                   // Disable resize
  background(BACKGROUND_COLOR);                  // Background refresh color
  frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
  
  initializeGlobals();                           // Initialize Globals
}


// Instantiate newt, engines, event dispatcher, spriteLibrary, &c
void initializeGlobals() {
 
  fileUtils = new FileUtils();
  spriteLibrary = new SpriteAnimationLibrary();
  
  newt = new GameCharacter(GameCharacterName.NEWT);
  comp  = new ComputationEngine();
  comp.players.add(newt);
  state  = new StateEngine(beginning);
  display = new DisplayEngine();
  dispatcher = new EventDispatcher();
  
  px=0; //px is the world translation in the x direction
  py=0; //py is the world translation in the y direction
  saveX = newt.getXPos();  //this saves newt's previous x position for movement delta purposes
  saveY = newt.getYPos();  //this saves newt's previous y position for movement delta purposes
  
  //init dialog global values//
  dialog = false;  //whether or not the dialog box pops up
  saveSpot = 0;     //the index of the script in the current dialog
  displayText = ""; //the text currently being displayed.
  
  
}

// Key Pressed Events
void keyPressed() {

  //newt.inputPressed();
  if (keyCode == UP) {
    newt.setDirection(MoveDirection.UP);
  }
  if(keyCode == DOWN){
    newt.setDirection(MoveDirection.DOWN);
  }
  if(keyCode == LEFT){
   newt.setDirection(MoveDirection.LEFT);
  }
  if(keyCode == RIGHT){
    newt.setDirection(MoveDirection.RIGHT);
  }
}

// Key Released Events
void keyReleased() {
  
//  newt.inputReleased();
if (keyCode == UP) {
    newt.releaseDirection(MoveDirection.UP);
  }
  if(keyCode == DOWN){
    newt.releaseDirection(MoveDirection.DOWN);
  }
  if(keyCode == LEFT){
   newt.releaseDirection(MoveDirection.LEFT);
  }
  if(keyCode == RIGHT){
    newt.releaseDirection(MoveDirection.RIGHT);
  }
  if(key == 'h' || key == 'H'){
      hitBoxMode = !hitBoxMode;
  }
  //Dialog Window Checks//
    if(key == ENTER){    //this is the dialog continue check.  Right now it pops up the window, loads the first line in the first conversation, and toggles through it.
        comp.updateDialog();
    
    }
}




void draw(){  
  
  // Run engines to handle incoming events
  state.run();
  comp.run();
  display.run();

}