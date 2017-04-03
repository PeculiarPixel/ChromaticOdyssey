class StateEngine{
  
  ArrayList<StateEvent> events = new ArrayList<StateEvent>();    // Queue of state events
  Level currentState;                                  // Current set level  
  
  void run() 
  {
    
    // Loop through all state swaps in the queue
    for (StateEvent e : events) 
    {
      swapState(e);
    }
      
    events.clear();  //May need to change when the state engine clears the event queue.  Should it be allowed to finish?
 
   //should have some sort of  comp.run(currentState) but it does it without explicitly stating it.
  }
  
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

}