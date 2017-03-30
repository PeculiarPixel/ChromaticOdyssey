class LevelTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(0, 155, 155);
  
  // Event to trigger when stepped on
  private StateEvent transitionEvent;
  
  // Constructor
  protected LevelTransitionTrigger(float x, float y, float w, float h, int level_index) {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.transitionEvent = new StateEvent(level_index);
  }
  
  // Send off the transition event to swap levels
  public void trigger() {
    if (!hasActivated()) {
    dispatcher.dispatch(transitionEvent);
    this.isActive = false;
    println("Transitioning to new level...");
    }
  }
  
}