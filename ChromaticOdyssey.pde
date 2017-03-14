import processing.video.*;
import processing.sound.*; //<>//
boolean initValues;

  void setup() {
    size(1024, 768, P2D);
    smooth();
    surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
    surface.setResizable(false);                   // Disable resize
    background(BACKGROUND_COLOR);                  // Background refresh color
    frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
    println("before globals");
    //initializeGlobals();                           // Initialize Globals
    println("after globals");                                  // Show title screen
    initValues = false;
    SoundFile song = new SoundFile(this, "Beepbox-Song.wav");
    song.loop();
  }

  // Instantiate newt, engines, event dispatcher, spriteLibrary, &c
  private void initializeGlobals() {
   
    fileUtils = new FileUtils();
    spriteLibrary = new SpriteAnimationLibrary();
    world = new World();
    comp  = new ComputationEngine();
    state  = new StateEngine();
    display = new DisplayEngine();
    dispatcher = new EventDispatcher();
    camera = new GameCamera();
    
    px = 0; //px is the world translation in the x direction
    py = 0; //py is the world translation in the y direction
    saveX = newt.getXPos();  //this saves newt's previous x position for movement delta purposes
    saveY = newt.getYPos();  //this saves newt's previous y position for movement delta purposes
    
    //init dialog global values//
    dialog = false;  //whether or not the dialog box pops up
    saveSpot = 0;     //the index of the script in the current dialog
    displayText = ""; //the text currently being displayed.
    
  }

  // Key Pressed Events
  void keyPressed() {
  
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
    if(key == ENTER){    //this is the dialog continue check.  Right now it pops up the window, loads the first line in the first conversation, and toggles through it.
        comp.updateDialog(); //<>//
    }
  }

  // Start the game intro and then the first level
  private void gameStart() {
    state.setState(LevelName.TEST_0);
  }



  // Draw game loop
  void draw(){  
    if(initValues==false){
      initializeGlobals();
      gameStart(); 
      initValues = true;
    }
    
    
    // Run engines to handle incoming events
    state.run();
    comp.run();
    display.run();
    
    //println(mouseX - px, mouseY - py);
    //println("newt", newt.getXPos(), newt.getYPos());
    
  }