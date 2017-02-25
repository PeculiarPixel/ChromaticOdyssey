class StateEngine{
  
   ArrayList<Event> events = new ArrayList<Event>();
   //ArrayList<StateEvent> stateEvents = new ArrayList<StateEvent>();   
  // ArrayList<ComputationEvent> computationEvents = new ArrayList<ComputationEvent>(); 
  // ArrayList<DisplayableEvent> displayableEvents = new ArrayList<DisplayableEvent>(); 
  Level currentState;
  void run(){
    Event checkEvent;
      for(int i=0;i<events.size();i++){
        checkEvent = events.get(i);
        if(checkEvent.type=="StateEvent"){
          swapState((StateEvent)checkEvent);
        }else if(checkEvent.type=="ComputationEvent"){
          sendComputable((ComputationEvent)checkEvent);
        }else if(checkEvent.type=="DisplayableEvent"){
          sendDisplayable((DisplayableEvent)checkEvent);
        }
        
      }
    events.clear();
 
   //should have some sort of  comp.run(currentState) but it does it without explicitly stating it.
  }
  
  void swapState(StateEvent event){  //swap the current state to the new state
    currentState = event.nextState;
    comp.clear();
    currentState = new Level(newt);
    //currentState = new State();
  }
  void sendComputable(ComputationEvent computation){  //send computables to computation engine to check
    comp.computationEvents.add(computation);
  }
  void sendDisplayable(DisplayableEvent displayable){  // send displayables to display engine to display
    //display.displayableEvents.add(displayable); // pending creation of the DisplayEngine
  }

    StateEngine(Level state){
      state = new Level(newt);
      currentState = state;
    }

}