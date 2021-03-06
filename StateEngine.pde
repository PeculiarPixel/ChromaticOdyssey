/* State Engine
*  Update game on changes of state (level changes)
*/
class StateEngine {
  
  ArrayList<StateEvent> events;    // Queue of state events
  Level currentState;                                            // Current set level
  public Level checkpoint;
  // Constructor
   public StateEngine() {
     this.events = new ArrayList<StateEvent>();
      checkpoint = new LevelCastleApproach();
      checkpoint.name = LevelName.CASTLE_APPROACH;
    }
  
  // Run the StateEngine to check for state changes
  void run() {
    
    // Loop through all state swaps in the queue
    for (StateEvent e : events) {
      e.send();
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
  
  public void stopLevelTheme() {
    sounds.stopCurrentTrack();
  }
  
  // Swap the current state to the new state
  public void setState(LevelName levelIndex) {    
      Level nextState = world.getLevel(levelIndex);
      cleanupEngineStates();
      swapState(nextState);
      display.setTransition(false);
  }
  
  // Swap the current state to the new state
  public void setStateFadeIn(LevelName levelIndex) {    
      Level nextState = world.getLevel(levelIndex);
      cleanupEngineStates();
      swapState(nextState);
      dispatcher.dispatch(new LevelTransitionFadeInEvent());
  }
  
  // Initialize and swap into the next state
  private void swapState(Level nextState) {
    nextState.initialize();
    this.currentState = nextState;
  }
 
  // Clean all engines of queued events before swapping states
  private void cleanupEngineStates() {
      stopLevelTheme();
      comp.clearEngine();
      display.clearEngine();
  }
  
  
  //// Set level
  //public void setState(Level state) {
  //  cleanupEngineStates();
  //  swapState(state);
  //}

}