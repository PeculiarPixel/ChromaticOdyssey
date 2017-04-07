class StateEvent extends Event {
  
  LevelName nextState;         // State to switch to
  
  // Constructor
  public StateEvent(LevelName nextState) {
    super(EventTypeEnum.STATE);
    this.nextState = nextState;
  }
  
  // Get level to transition to
  public void send() {
    state.setState(nextState);// might want to fix this
    }
    
  }