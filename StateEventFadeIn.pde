class StateEventFadeIn extends StateEvent {
  
  // Constructor
  public StateEventFadeIn(LevelName nextState) {
    super(nextState);
  } 
  
  // Send a fade in transition
  public void send() {
    state.setStateFadeIn(this.nextState);
  }

}