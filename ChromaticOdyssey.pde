import processing.video.*;
import ddf.minim.*;

PApplet master = this;

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
    
    if (DEBUG.MUSIC_ON) {
      println("Loading file a.wav");
      AudioPlayer song = minim.loadFile("a.wav");
      song.loop();
    }
  
    if (DEBUG.INTRO_ON) {
      introScreen = new Movie(master, "TitleScreen.mp4");
      introScreen.loop();
    }
    
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
    drawUtils = new DrawUtilities();
    
    kitMoveSet = new ArrayList<MoveDirection>();
    kitMoveRelease = new ArrayList<MoveDirection>();
   
    startTime = new IntList();
    stopTime = new IntList();
    kitFollowDelay = 700;

    
  }

  // Key Pressed Events
  void keyPressed() {

    
    if (keyCode == UP) {
      newt.setDirection(MoveDirection.UP);
     // kit.setDirection(MoveDirection.UP);
      kitMoveSet.add(MoveDirection.UP);
      startTime.append(millis());
    }
    if(keyCode == DOWN){
      newt.setDirection(MoveDirection.DOWN);
      //kit.setDirection(MoveDirection.DOWN);
      kitMoveSet.add(MoveDirection.DOWN);
      startTime.append(millis());
    }
    if(keyCode == LEFT){
     newt.setDirection(MoveDirection.LEFT);
     //kit.setDirection(MoveDirection.LEFT);
     kitMoveSet.add(MoveDirection.LEFT);
     startTime.append(millis());
    }
    if(keyCode == RIGHT){ //<>// //<>//
      newt.setDirection(MoveDirection.RIGHT);
     // kit.setDirection(MoveDirection.RIGHT);
      kitMoveSet.add(MoveDirection.RIGHT);
      startTime.append(millis());
    } //<>// //<>//
  } //<>// //<>//

  // Key Released Events //<>// //<>// //<>//
  void keyReleased() {
        //kitKeyRelease = false;
        
  if (keyCode == UP) { //<>// //<>//
      newt.releaseDirection(MoveDirection.UP); //<>// //<>// //<>//
     // kit.releaseDirection(MoveDirection.UP);
      kitMoveRelease.add(MoveDirection.UP);
      stopTime.append(millis());
    }
    if(keyCode == DOWN){
      newt.releaseDirection(MoveDirection.DOWN);
     // kit.releaseDirection(MoveDirection.DOWN);
      kitMoveRelease.add(MoveDirection.DOWN);
      stopTime.append(millis());
    }
    if(keyCode == LEFT){ //<>//
     newt.releaseDirection(MoveDirection.LEFT);
     //kit.releaseDirection(MoveDirection.LEFT);
     kitMoveRelease.add(MoveDirection.LEFT); 
     stopTime.append(millis()); 
    } //<>// //<>//
    if(keyCode == RIGHT){
      newt.releaseDirection(MoveDirection.RIGHT);
      //kit.releaseDirection(MoveDirection.RIGHT);
      kitMoveRelease.add(MoveDirection.RIGHT); //<>//
      stopTime.append(millis());
    }
    if(key == 'h' || key == 'H'){ //<>// //<>//
        hitBoxMode = !hitBoxMode;
    }
    if(key == 'b' || key == 'B'){
       println();  //<>// //<>//
    }
    if(key == 'p' || key == 'P'){
        if (DEBUG.DEV_MODE) println("Newt X: " + newt.getXPos());
        if (DEBUG.DEV_MODE) println("Newt Y: " + newt.getYPos());
    } //<>// //<>// //<>// //<>//
    if(key == ENTER){    //this is the dialog continue check.  Right now it pops up the window, loads the first line in the first conversation, and toggles through it.
        display.updateCurrentScript();
    }
  } 

  // Start the game intro and then the first level
  private void gameStart() {
    if (DEBUG.INTRO_ON) state.setState(LevelName.INTRO); //<>// //<>//
    else state.setState(LevelName.CASTLE_HUB);
  }

  // Handle movie event
  public void movieEvent(Movie m) { //<>//
    m.read();
  }


  // Draw game loop
  void draw(){  
    
    // Setup global values if first run
    if (initValues == false) {
      initializeGlobals();
      gameStart(); 
      initValues = true;
    }
    
    // Run engines to handle incoming events
    state.run();
    comp.run();
    display.run();
    
  }