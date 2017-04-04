
// Handler for dispatching events to correct destinations
class EventDispatcher {
  
  // Dispatch new state event
  public void dispatch(StateEvent e) { state.events.add(e); }
  
  // Dispatch new computation event
  public void dispatch(ComputationEvent e) { comp.events.add(e); }
  
  // Dispatch new display event
  public void dispatch(DisplayableEvent e) { display.events.add(e); }
  
  // Clear active display events
  public void dispatchClear(DisplayableEvent e) { display.inactiveEvents.add(e); }
  
}