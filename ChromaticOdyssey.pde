import processing.video.*;
import ddf.minim.*;

// Combat module libraries:
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;
import javax.*;
import javax.swing.*;

PApplet master = this;

  void setup() 
  {
    //size(1024, 768, P2D);
    size(1024, 768);
    smooth(); //<>// //<>// //<>// //<>//

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
    
    px = 0; //px is the world translation in the x direction
    py = 0; //py is the world translation in the y direction
    saveX = newt.getXPos();  //this saves newt's previous x position for movement delta purposes
    saveY = newt.getYPos();  //this saves newt's previous y position for movement delta purposes
    
        //init dialog global values//
    dialog = false;  //whether or not the dialog box pops up
    saveSpot = 0;     //the index of the script in the current dialog
    displayText = ""; //the text currently being displayed.
  
    // Combat module initializations:
    
    imageMaker = new ImageMaker();
  
  BufferedImage p1i = imageMaker.drawTestSprite(Color.RED);
  BufferedImage p2i = imageMaker.drawTestSprite(Color.BLUE);
  
  int[] modifiers = {0, 0, 0};
  int[] baseStats = {10, 10, 10};
    
  CombatColor defaultColor = new CombatColor(Color.GRAY, modifiers, 2);
  
  inventory = new int[]{1, 2, 3, 4, 5, 6};
  
  int[][] meterMods = new int[3][3];
   meterMods[0][0] = 5;
   meterMods[0][1] = -2;
   meterMods[0][2] = -2;
   meterMods[1][0] = -2;
   meterMods[1][1] = 5;
   meterMods[1][2] = -2;
   meterMods[2][0] = -2;
   meterMods[2][1] = -2;
   meterMods[2][2] = 5;
  
   Combatant player = new Combatant("Player", p1i, defaultColor, baseStats, meterMods);
   Combatant enemy = new Combatant("Enemy", p2i, defaultColor, baseStats, meterMods);
  
   fightManager = new FightManager(player,enemy,inventory);  
   
   inCombat = false;
   lockMouseInput = false;

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
    if(!inCombat)
    {
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
      
      kitKeyPress = true;
    }
  } //<>//
 //<>// //<>// //<>// //<>//
  // Key Released Events //<>// //<>// //<>// //<>//
  void keyReleased() { //<>// //<>//
     //<>// //<>// //<>//
        kitKeyPress = false; //<>// //<>//
  if (keyCode == UP) { //<>// //<>//
      newt.releaseDirection(MoveDirection.UP); //<>// //<>// //<>// //<>//
      kitMoveRelease.remove(0);       //<>//
      kitMoveRelease.add(MoveDirection.UP);
    }
    if(keyCode == DOWN){
      newt.releaseDirection(MoveDirection.DOWN);
      kitMoveRelease.remove(0); 
      kitMoveRelease.add(MoveDirection.DOWN);
    }
    if(keyCode == LEFT){ //<>//
     newt.releaseDirection(MoveDirection.LEFT);
     kitMoveRelease.remove(0);     
     kitMoveRelease.add(MoveDirection.LEFT); //<>// //<>//
    } //<>// //<>// //<>//
    if(keyCode == RIGHT){
      newt.releaseDirection(MoveDirection.RIGHT);
      kitMoveRelease.add(MoveDirection.RIGHT);
    } //<>//
    if(key == 'h' || key == 'H'){ //<>// //<>//
        hitBoxMode = !hitBoxMode; //<>//
    }
    if(key == 'c' || key == 'C')
        {
          // Trigger combat
          inCombat = !inCombat;
        } //<>//
    if(key == 'b' || key == 'B'){ //<>// //<>// //<>//
       println();  //<>//
    }
    if(key == 'p' || key == 'P'){
        if (DEBUG.DEV_MODE) println("Newt X: " + newt.getXPos());
        if (DEBUG.DEV_MODE) println("Newt Y: " + newt.getYPos());
    }
    if(key == ENTER){    //this is the dialog continue check.  Right now it pops up the window, loads the first line in the first conversation, and toggles through it.
        display.updateCurrentScript();
    } //<>//
  } //<>// //<>// //<>//
 //<>//
  // Start the game intro and then the first level
  private void gameStart() { //<>//
    if (DEBUG.INTRO_ON) state.setState(LevelName.INTRO); //<>// //<>// //<>//
    else state.setState(LevelName.TEST_0);
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
    if(!inCombat)
    {
      state.run();
      comp.run();
      display.run();
    }
    else
    {
      fightManager.drawActive();
      // Image has to be offset to the center of the screen, presumably due to matrix transform issues:
      image(fightManager.getAsPImage(), 512, 384);
    }
    
    //println(mouseX - px, mouseY - py);
    //println("newt", newt.getXPos(), newt.getYPos());
    
  }
  
  void mousePressed()
{
  if(inCombat && !lockMouseInput)
    fightManager.pressCheck();
}

void mouseMoved()
{
  if(inCombat  && !lockMouseInput)
    fightManager.hoverCheck();
}