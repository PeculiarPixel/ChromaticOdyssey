import processing.video.*;
import ddf.minim.*;

// Combat module imports:
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;
import javax.*;
import javax.swing.*;


/*
// Outdated setup?
void setup(){
  //gg boys
  surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
  surface.setResizable(false);                   // Disable resize
  background(BACKGROUND_COLOR);                  // Background refresh color
  frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
  
  initializeGlobals();                           // Initialize Globals
}
*/


  boolean initValues; //<>//
  
  void setup() 
  {
    size(1024,768,P2D);
    smooth();
    surface.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);  // Setup screen width
    surface.setResizable(false);                   // Disable resize
    background(BACKGROUND_COLOR);                  // Background refresh color
    frameRate(FRAMES_PER_SECOND_RATE);             // FPS rate
    println("before globals");
    //initializeGlobals();                           // Initialize Globals
    println("after globals");                                  // Show title screen
    initValues = false;
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

    // Combat and sound stuff:
    
    // Sounds for testing
   minim = new Minim(this);
  song = minim.loadFile("BeepBox-Song.wav");
  footstep = minim.loadFile("Sounds/VeryPaddedFootstep.wav");
  //song.loop();
  
  // Combat module stuff:
  
  imageMaker = new ImageMaker();
  
  BufferedImage p1i = imageMaker.drawTestSprite(Color.RED);
  BufferedImage p2i = imageMaker.drawTestSprite(Color.BLUE);
  
  int[] modifiers = {0, 0, 0};
  int[] baseStats = {10, 10, 10};
    
  CombatColor defaultColor = new CombatColor(Color.GRAY, modifiers, 2);
  
  int[] inventory = new int[]{1, 2, 3, 4, 5, 6};
  
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
  
   player = new Combatant("Player", p1i, defaultColor, baseStats, meterMods);
   enemy = new Combatant("Enemy", p2i, defaultColor, baseStats, meterMods);
  
   fightManager = new FightManager(player,enemy,inventory); 
   
   inCombat = false;
    
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

// Mouse events

void mousePressed()
{
  fightManager.pressCheck();
}

void mouseMoved()
{
  fightManager.hoverCheck();
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