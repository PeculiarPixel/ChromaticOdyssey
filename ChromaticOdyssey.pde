import processing.video.*;
import ddf.minim.*; //<>// //<>//

  
boolean initValues; //<>// //<>// //<>//
boolean kitKeyPress;

ArrayList<MoveDirection> kitMoveSet;
ArrayList<MoveDirection> kitMoveRelease;

  // Setup Game
  void setup() {
    size(1024, 768, P2D);
    smooth();
    surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
    surface.setResizable(false);                   // Disable resize
    background(BACKGROUND_COLOR);                  // Background refresh color
    frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
                                
    initValues = false;
       
    Minim minim = new Minim(this); 
    
    println("Loading file a.wav");
    AudioPlayer song = minim.loadFile("a.wav");
    song.loop();
     
    //println("Opening Beepbox-Song.wav");
    //SoundFile song = new SoundFile(this, "a.wav");
    
    //println("Looping song");
    
    //song.loop();
    
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
    
    kitKeyPress = false;
    kitMoveSet = new ArrayList<MoveDirection>();
    kitMoveRelease = new ArrayList<MoveDirection>();
    
    
    
   /* for(int i=0;i<20;i++){
     kitMoveSet.add(MoveDirection.IDLE_DOWN);
     kitMoveRelease.add(MoveDirection.IDLE_DOWN);
    }*/
    
  }

  // Key Pressed Events
  void keyPressed() {
    
    kitKeyPress = true;
    
    if (keyCode == UP) {
      newt.setDirection(MoveDirection.UP);
     // kitMoveSet.add(MoveDirection.UP);
    }
    if(keyCode == DOWN){
      newt.setDirection(MoveDirection.DOWN);
     // kitMoveSet.add(MoveDirection.DOWN);
    }
    if(keyCode == LEFT){
     newt.setDirection(MoveDirection.LEFT);
    // kitMoveSet.add(MoveDirection.LEFT);
    }
    if(keyCode == RIGHT){
      newt.setDirection(MoveDirection.RIGHT);
     // kitMoveSet.add(MoveDirection.RIGHT);
    }
  }

  // Key Released Events //<>// //<>//
  void keyReleased() {
        kitKeyPress = false;
  if (keyCode == UP) { //<>//
      newt.releaseDirection(MoveDirection.UP); //<>// //<>//
     // kitMoveRelease.add(MoveDirection.UP);
    }
    if(keyCode == DOWN){
      newt.releaseDirection(MoveDirection.DOWN);
     // kitMoveRelease.add(MoveDirection.DOWN);
    }
    if(keyCode == LEFT){
     newt.releaseDirection(MoveDirection.LEFT);
    // kitMoveRelease.add(MoveDirection.LEFT);
    }
    if(keyCode == RIGHT){
      newt.releaseDirection(MoveDirection.RIGHT);
    //  kitMoveRelease.add(MoveDirection.RIGHT);
    }
    if(key == 'h' || key == 'H'){
        hitBoxMode = !hitBoxMode;
    }
    if(key == 'b' || key == 'B'){
       println(); //<>// //<>// //<>//
    }
    if(key == ENTER){    //this is the dialog continue check.  Right now it pops up the window, loads the first line in the first conversation, and toggles through it.
        display.updateCurrentScript();
    }
  } //<>// //<>//

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