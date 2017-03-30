class StateEvent extends Event {
  
  int nextState;         // State to switch to
  
  // Constructor
  public StateEvent(int nextState) {
    type = EventTypeEnum.STATE;
    this.nextState = nextState;
  }
  
  // Get level to transition to
  public int getState() {
    return nextState;
  }
  
}