import processing.video.*;

void setup(){
  
  surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
  surface.setResizable(false);                   // Disable resize
  background(BACKGROUND_COLOR);                  // Background refresh color
  frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
  
  initializeGlobals();                           // Initialize Globals
  
}


// Instantiate newt, engines, event dispatcher, spriteLibrary, &c
void initializeGlobals() {
  
  newt = new GameCharacter();
  comp  = new ComputationEngine();
  comp.players.add(newt);
  state  = new StateEngine(beginning);
  display = new DisplayEngine();
  dispatcher = new EventDispatcher();
  spriteLibrary = new SpriteAnimationLibrary();
  fileUtils = new FileUtils();
  
  px=0; //px is the world translation in the x direction
  py=0; //py is the world translation in the y direction
  saveX = newt.local.xPos;  //this saves newt's previous x position for movement delta purposes
  saveY = newt.local.yPos;  //this saves newt's previous y position for movement delta purposes
  
  try {
    newtWalk = spriteLibrary.getSpriteAnimation("NewtWalk");
    newtIdle = spriteLibrary.getSpriteAnimation("NewtIdle");
  } catch (DirectoryNotFoundException dnfe) {
      println(dnfe.getLocalizedMessage());
  } catch (NoDirPathEntryFoundException ndpfe) {
      println(ndpfe.getLocalizedMessage());
  }
  
}


void keyPressed() {

  //newt.inputPressed();
  if (keyCode == UP) {
    newt.local.moveUp = true;
  }
  if(keyCode == DOWN){
    newt.local.moveDown = true;
  }
  if(keyCode == LEFT){
   newt.local.moveLeft = true;
  }
  if(keyCode == RIGHT){
    newt.local.moveRight = true;
  }
}


//boolean hitBoxMode = false;

void keyReleased() {
  
//  newt.inputReleased();
if (keyCode == UP) {
    newt.local.moveUp = false;
  }
  if(keyCode == DOWN){
    newt.local.moveDown = false;
  }
  if(keyCode == LEFT){
   newt.local.moveLeft = false;
  }
  if(keyCode == RIGHT){
    newt.local.moveRight = false;
  }
  if(key == 'h' || key == 'H'){
      hitBoxMode = !hitBoxMode;
  }

}




void draw(){  
  
  // Run engines to handle incoming events
  state.run();
  comp.run();
  display.run();

}