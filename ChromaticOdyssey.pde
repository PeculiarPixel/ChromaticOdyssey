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
    
    kitKeyPress = false;
    kitMoveSet = new ArrayList<MoveDirection>();
    kitMoveRelease = new ArrayList<MoveDirection>();
   
    for(int i=0;i<75;i++){
     kitMoveSet.add(MoveDirection.IDLE_DOWN);
     kitMoveRelease.add(MoveDirection.IDLE_DOWN);
    }
    
  }

  // Key Pressed Events
  void keyPressed() {
    
    kitKeyPress = true;
    
    if (keyCode == UP) {
      newt.setDirection(MoveDirection.UP);
    //  kitMoveSet.add(MoveDirection.IDLE_DOWN);
    }
    if(keyCode == DOWN){
      newt.setDirection(MoveDirection.DOWN);
    //  kitMoveSet.add(MoveDirection.IDLE_DOWN);
    }
    if(keyCode == LEFT){
     newt.setDirection(MoveDirection.LEFT);
   // kitMoveSet.add(MoveDirection.IDLE_DOWN);
    }
    if(keyCode == RIGHT){ //<>// //<>//
      newt.setDirection(MoveDirection.RIGHT);
     //kitMoveSet.add(MoveDirection.IDLE_DOWN);
    } //<>// //<>//
  } //<>// //<>//

  // Key Released Events //<>// //<>// //<>//
  void keyReleased() {
        kitKeyPress = false;
        
      //  kitMoveRelease.remove(0);
      //  kitMoveRelease.remove(0);
      //  kitMoveRelease.add(copy);
      //  kitMoveRelease.add(secondaryCopy);
  if (keyCode == UP) { //<>// //<>//
      newt.releaseDirection(MoveDirection.UP); //<>// //<>// //<>//
      
        MoveDirection copy = newt.local.direction;
       // MoveDirection secondaryCopy = newt.local.secondaryDirection;
      kitMoveRelease.remove(0);      
      kitMoveRelease.add(copy);
        //MoveDirection secondaryCopy = newt.local.secondaryDirection;
    }
    if(keyCode == DOWN){
      newt.releaseDirection(MoveDirection.DOWN);
      
      MoveDirection copy = newt.local.direction;
      kitMoveRelease.remove(0); 
      kitMoveRelease.add(copy);
    }
    if(keyCode == LEFT){ //<>//
     newt.releaseDirection(MoveDirection.LEFT);
             MoveDirection copy = newt.local.direction;
     kitMoveRelease.remove(0);     
     kitMoveRelease.add(copy);
    } //<>// //<>//
    if(keyCode == RIGHT){
      newt.releaseDirection(MoveDirection.RIGHT); //<>//
              MoveDirection copy = newt.local.direction;
      kitMoveRelease.remove(0);
      kitMoveRelease.add(copy);
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