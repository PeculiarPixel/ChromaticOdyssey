/* State Engine
*  Update game on changes of state (level changes)
*/
class StateEngine {
  
  ArrayList<StateEvent> events = new ArrayList<StateEvent>();    // Queue of state events
  Level currentState;                                            // Current set level
  
  // Constructor
 public StateEngine(Level state){
      state = new Test_Level_0(newt);
      currentState = state;
  }
  
  // Run the StateEngine to check for state changes
  void run() {
    
    // Loop through all state swaps in the queue
    for (StateEvent e : events) {
      swapState(e);
    }
      
    events.clear();  //May need to change when the state engine clears the event queue.  Should it be allowed to finish?
 
   //should have some sort of  comp.run(currentState) but it does it without explicitly stating it.
  }
  
  // Swap the current state to the new state
  public void swapState(StateEvent event) {   
    currentState = event.nextState;
  }

}