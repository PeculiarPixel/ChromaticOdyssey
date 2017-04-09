import processing.video.*;
import ddf.minim.*;

// Combat module libraries:
import java.awt.*;
import java.awt.image.*;
import java.awt.event.*;
import java.util.*;
import javax.*;
import javax.imageio.ImageIO;
import javax.swing.*;

PApplet master = this;

  void setup() 
  {
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
      introStory = new Movie(master, "Intro.mp4");
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
  
      kitMoveSet = new ArrayList<MoveDirection>();
      kitMoveRelease = new ArrayList<MoveDirection>();
     
      startTime = new IntList();
      stopTime = new IntList();
      kitFollowDelay = 700;
    
  }

  // Key Pressed Events
  void keyPressed() {

    if(!inCombat) {
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
       startTime.append(millis()); //<>//
      }
      if(keyCode == RIGHT){ //<>// //<>// //<>//
        newt.setDirection(MoveDirection.RIGHT);
       // kit.setDirection(MoveDirection.RIGHT);
        kitMoveSet.add(MoveDirection.RIGHT);
        startTime.append(millis());
      }
    }
  }

  // Key Released Events //<>// //<>// //<>//
  void keyReleased() {
        
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
    if(key == 'c' || key == 'C') {
          // Trigger combat
          inCombat = !inCombat;
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
    if (key == 's' || key == 'S' && state.currentState.name == LevelName.INTRO) {
      introStory.jump(introStory.duration());
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
      image(fightManager.getAsPImage(fightManager.getImg()), 512, 384);
    }
    
    //println(mouseX - px, mouseY - py);
    //println("newt", newt.getXPos(), newt.getYPos());
    
  }
  
  void mousePressed()
{
  if(inCombat && !lockMouseInput) {
    fightManager.pressCheck();
    return;
  }
   
  if (state.currentState.name == LevelName.INTRO) {
      if (mouseX > 511 && mouseX < 827 && mouseY > 385 && mouseY < 552 && runIntroStory == false) {
      introScreen.stop();
      introStory.play(); //<>// //<>//
      runIntroStory = true;
      return;
    }
  }
    
}

void mouseMoved()
{
  if(inCombat  && !lockMouseInput)
    fightManager.hoverCheck();
}