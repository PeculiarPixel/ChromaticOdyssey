
// Handler for dispatching events to correct destinations
class EventDispatcher {
  
  public void dispatch(StateEvent e) { state.events.add(e); }
  
  public void dispatch(ComputationEvent e) { comp.events.add(e); }
  
  public void dispatch(DisplayableEvent e) { display.events.add(e); }
  
}