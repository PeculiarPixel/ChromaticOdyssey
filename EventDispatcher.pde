
// Handler for dispatching events to correct destinations
class EventDispatcher {
  
  // Dispatch given event to correct engine
  void dispatch(Event e) { 
    switch(e.type) {
      case COMPUTATION:
         sendComputable((ComputationEvent) e);  // Send computation events
        break;
      case STATE:
        sendState((StateEvent) e);              // Send state events
        break;
      case DISPLAY:
        sendDisplayable((DisplayableEvent) e);  // Send displayable events
        break;
      default: 
        println("Event class not registered");  
    }
  }
  
  private void sendState(StateEvent stateEvent){  //send computables to computation engine to check
    state.events.add(stateEvent);
  }
  
  private void sendComputable(ComputationEvent computationEvent){  //send computables to computation engine to check
    comp.events.add(computationEvent);
  }
  
  private void sendDisplayable(DisplayableEvent displayableEvent){  // send displayables to display engine to display
    display.events.add(displayableEvent); // pending creation of the DisplayEngine
  }
  
}