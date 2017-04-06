class LevelTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(0, 155, 155);
  
  // Event to trigger when stepped on
  private LevelTransitionEvent transitionEvent;
  
  // Constructor
  protected LevelTransitionTrigger(float x, float y, float w, float h, LevelName level_name) {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.transitionEvent = new LevelTransitionEvent(level_name, level_name.getDescription());
  }
  
  // Send off the transition event to swap levels
  public void trigger() {
      display.setTransition(true);
      dispatcher.dispatch(transitionEvent);
      triggerEvents();
      
      if (DEBUG.EVENT_LOGGING) println("Transitioning to level: " + transitionEvent.toString());
      
  }
  
}