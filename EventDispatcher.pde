
// Handler for dispatching events to correct destinations
class EventDispatcher {
  
  public void dispatch(StateEvent e) { sendState(e); }
  
  public void dispatch(ComputationEvent e) { sendComputable(e); }
  
  public void dispatch(DisplayableEvent e) { sendDisplayable(e); }
  
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