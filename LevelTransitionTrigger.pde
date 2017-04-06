class LevelTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(0, 155, 155);
  
  // Event to trigger when stepped on
  private StateEvent transitionEvent;
  
  // Constructor
  protected LevelTransitionTrigger(float x, float y, float w, float h, LevelName level_name) {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.transitionEvent = new StateEvent(level_name);
  }
  
  // Send off the transition event to swap levels
  public void trigger() {
    
      dispatcher.dispatch(transitionEvent);
      triggerEvents();
      
      println("Transitioning to level: " + transitionEvent.toString());
      
  }
  
}