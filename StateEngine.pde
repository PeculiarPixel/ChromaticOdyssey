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
  
  
  // Clear the engine
  public void clearEngine() {
    clearEvents();
  }
  
  // Get state to swap to and pass off
  private void handleStateEvent(StateEvent event) {
    int nextLevel = event.getState();
    setState(nextLevel);
  }
  
  // Swap the current state to the new state
  public void setState(int levelIndex) {    
      Level nextState = world.getLevelByIndex(levelIndex);
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