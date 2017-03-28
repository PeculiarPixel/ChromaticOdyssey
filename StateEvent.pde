class StateEvent extends Event {

 //Level currentState;      // Current state
  Level nextState;         // State to switch to
  
  StateEvent(Level nextState){
    type = EventTypeEnum.STATE;
    this.nextState = nextState;
  }
  
}