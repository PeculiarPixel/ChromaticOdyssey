/*  Display Engine
*   Draw received events in game
*/
class DisplayEngine {
  
   // Displayable events
   ArrayList<DisplayableEvent> events;
   ArrayList<DisplayableEvent> inactiveEvents;
   

   ScriptQueue scriptQueue;                     // Queue of conversations
   boolean transition;                          //State Transition in progress
   
   int occupacity = 0;
   
   // Constructor
   public DisplayEngine() {
     
     this.events = new ArrayList<DisplayableEvent>();
     this.inactiveEvents = new ArrayList<DisplayableEvent>();
     this.scriptQueue = new ScriptQueue();
     this.transition = false;
     
   }
   
   // Set display as being in the middle of a transition event
   public void setTransition(boolean value) { this.transition = value; }
  
  // Display hitboxes
  public void displayArea(Area hit) {
    fill(255,255,255);
    stroke(10);  
    fill(hit.showColor, 100);
    rectMode(CENTER);
    rect(hit.xPos, hit.yPos, hit.getWidth(), hit.getHeight());
  }

  // Queue up a script to be displayed
  public void queueScript(Script s) { this.scriptQueue.enqueue(s); }
  
  // Clear script queue
  public void clearScriptQueue() { this.scriptQueue.clearScripts(); }
  
  // Iterate through the current script
  public void updateCurrentScript() {
    this.scriptQueue.updateCurrentScript();
  }
  
  
  // Display game characters //<>// //<>// //<>//
  public void displayCharacter(GameCharacter c) { //<>// //<>// //<>//
 //<>// //<>// //<>// //<>//
    imageMode(CENTER); //<>// //<>// //<>// //<>// //<>//
    c.updateSpriteAnimation(); //<>// //<>// //<>// //<>// //<>//
    image(c.getCurrentImage(), c.getXPos(), c.getYPos()); //<>// //<>// //<>//
    if(c.local.hitboxDisplay) { //<>// //<>// //<>//
      displayArea(c.getHitbox()); //<>// //<>// //<>// //<>//
    }  //<>// //<>// //<>//
      //<>// //<>//
  }  //<>// //<>// //<>//
   //<>// //<>//
  // Display Landscapes
  public void displayLandscape(Landscape land){
    land.draw();
  }
  
  // Display all characters in state's current level //<>// //<>//
  private void displayCharacters() { //<>// //<>// //<>// //<>//
    imageMode(CORNER); //<>// //<>// //<>// //<>//
     //<>// //<>//
    for(int i=2;i<state.currentState.characters.size();i++){ //<>//
      displayCharacter(state.currentState.characters.get(i));
    }
    
    if(newt.local.yPos<kit.local.yPos){ //<>//
          displayCharacter(newt);
          displayCharacter(kit);
    }else{
          displayCharacter(kit);
          displayCharacter(newt);
    }
    
    
    
    
    
 /*   for (GameCharacter c : state.currentState.characters) {
      if (DEBUG.DISPLAY_LOGGING) println("DISPLAYING CHARACTER: " + c.name);
      if (DEBUG.DISPLAY_LOGGING) println("position: ",c.local.xPos,", ",c.local.yPos);
      displayCharacter(c);

    }*/
  }
  
  // Display all landscapes in state's current level
  private void displayLandscapes() {
    for (Landscape l : state.currentState.landscapes) {
      displayLandscape(l);
    } //<>//
  } //<>//
   //<>//
  // Display triggers //<>// //<>//
  private void displayTriggers() { //<>// //<>//
    for (Trigger t : state.currentState.triggers) { //<>// //<>//
      if (newt.local.hitboxDisplay) { //<>//
        displayArea(t); //<>// //<>// //<>//
      } //<>// //<>//
    } //<>// //<>//
  } //<>// //<>//
   //<>//
  // Draw currently queued script //<>//
  private void displayDialog() { //<>//
    if (!this.scriptQueue.isEmpty()) this.scriptQueue.draw(); //<>//
  } //<>// //<>//
   //<>//
  // Clear Display Engine of Events //<>//
  public void clearEvents() {
    this.events.clear();
  } //<>//
 //<>// //<>//
  public void clearEngine() { //<>// //<>//
    clearEvents();
    clearScriptQueue(); //<>//
  } //<>//
    //<>// //<>//
  public Script getCurrentScript() { //<>// //<>// //<>//
   return null; //<>// //<>//
  } //<>// //<>//
 //<>// //<>//
  // Run display engine //<>// //<>// //<>//
  void run() { //<>// //<>//
     //<>// //<>//
   background(0);      //  Init background //<>// //<>//
    //<>// //<>//
   if (state.currentState.name == LevelName.OUTRO){ //<>//  
     OUTRO.play();
     imageMode(CORNER);
     image(OUTRO,0, 98, width, 572); 
  }else if (state.currentState.name == LevelName.GAME_OVER){ //<>//  
     GAME_OVER.play();
     imageMode(CORNER);
     image(GAME_OVER, 0, 98, width, 572); 
  }else if (state.currentState.name == LevelName.INTRO){ //<>// //<>//
     if(runIntroStory == false){
      image(introScreen, 0, 0, width, height);
      }
      else{
        image(introStory, 0, 98, width, 572); //<>//
        textSize(20);
        fill(255, 255, 255, occupacity);
        text("Press \"s\" to skip", width -180, height-40);
        if(introStory.time() > 2 && introStory.time() < 10){
          occupacity++; //<>//
        }
        else{
          occupacity--;
        }
      } //<>//     //<>//
   }
    
   //<>//
     //<>//
   else { //<>//
     
      pushMatrix();
      camera.fixedUpdate(); // Update camera positions //<>//
      //<>//
      // Draw background layer
      imageMode(CORNER); 
      //image(state.currentState.backgroundImage, 0 - camera.getXPos(), 0 - camera.getYPos());
      image(state.currentState.backgroundImage, 0, 0);
      
      // Display characters
      displayCharacters();
      
      // Draw foreground
      imageMode(CORNER);
      //image(state.currentState.foregroundImage, 0 - camera.getXPos(), 0 - camera.getYPos());
      image(state.currentState.foregroundImage, 0, 0);
      
      // Display landscapes
      displayLandscapes();
      displayTriggers();
      
      state.currentState.fog.run(-1);
  
      // Pop translate matrix
      popMatrix(); 
    
      newt.local.hitboxDisplay = hitBoxMode;
      
      displayDialog();
    
    }
            
    for (DisplayableEvent e : events) { if (!e.isFinished()) e.send(); }
    
    for(DisplayableEvent e : inactiveEvents) { this.events.remove(e); }
    
    inactiveEvents.clear();
    
  
  }

}