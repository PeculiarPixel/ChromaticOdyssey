class StateEvent extends Event {
  
  LevelName nextState;         // State to switch to
  
  // Constructor
  public StateEvent(LevelName nextState) {
    type = EventTypeEnum.STATE;
    this.nextState = nextState;
  }
  
  // Get level to transition to
  public LevelName getState() {
    return nextState;
  }
  
}