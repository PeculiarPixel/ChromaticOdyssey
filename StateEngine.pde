/* State Engine
*  Update game on changes of state (level changes)
*/
class StateEngine {
  
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
  
  
  // Set level
  public void setState(Level state) {
    cleanupEngineStates();
    swapState(state);
  }

}