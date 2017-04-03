/* State Engine
*  Update game on changes of state (level changes)
*/
class StateEngine {
  
<<<<<<< HEAD
  ArrayList<StateEvent> events = new ArrayList<StateEvent>();    // Queue of state events
  Level currentState;                                  // Current set level  
  
  void run() 
  {
    
    // Loop through all state swaps in the queue
    for (StateEvent e : events) 
    {
      swapState(e);
=======
  ArrayList<StateEvent> events;    // Queue of state events
  Level currentState;                                            // Current set level
  
  // Constructor
   public StateEngine() {
     this.events = new ArrayList<StateEvent>();  
    }
  
  // Run the StateEngine to check for state changes
  void run() {
    
    // Loop through all state swaps in the queue
    for (StateEvent e : events) {
      handleStateEvent(e);
>>>>>>> refs/remotes/origin/master
    }
      
    clearEvents(); // May need to change when the state engine clears the event queue.  Should it be allowed to finish?

  }
  
  // Clear state events
  public void clearEvents() {
    this.events.clear();
  }
  
  // Get current state size
  public LevelSize getCurrentStateSize() {
    return this.currentState.getStateSize();
  }
  
  
  // Clear the engine
  public void clearEngine() {
    clearEvents();
  }
  
  // Get state to swap to and pass off
  private void handleStateEvent(StateEvent event) {
        display.transition = true;
        display.transitionEvent = event;
        //setState(event.getState()); do this later with animation timing.  Or add a check to the StateEvent to see if it needs a transition or not.
  }
  
  // Swap the current state to the new state
  public void setState(LevelName levelIndex) {    
      Level nextState = world.getLevel(levelIndex);
      cleanupEngineStates();
      swapState(nextState);
  }
  
  // Initialize and swap into the next state
  private void swapState(Level nextState) {
    nextState.initialize();
    this.currentState = nextState;
  }
 
  // Clean all engines of queued events before swapping states
  private void cleanupEngineStates() {
      comp.clearEngine();
      display.clearEngine();
  }
  
<<<<<<< HEAD
  void swapState(StateEvent event)
  {  //swap the current state to the new state
    if(event.type != "Fight")
    {
      inCombat = false;
      currentState = event.nextState;
    //comp.clear(); //Nathan - I moved this clear to a method inside Level.  When a state swap occurs the comp is cleared right before next level initializes.
    }
    else
    {
      inCombat = true;
      
    }
  }

    StateEngine(Level state)
    {
      state = new Test_Level_0(newt);
      currentState = state;
      inCombat = false;
    }

=======
  
  // Set level
  public void setState(Level state) {
    cleanupEngineStates();
    swapState(state);
  }

>>>>>>> refs/remotes/origin/master
}