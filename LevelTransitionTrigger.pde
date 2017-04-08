class LevelTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(0, 155, 155);
  
  // Event to trigger when stepped on
  private LevelName level_name;
  
  // Constructor
  protected LevelTransitionTrigger(float x, float y, float w, float h, LevelName level_name) {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);
    this.level_name = level_name;
    
  }
  
  public void initialize() {
    this.deactivate(); 
    this.clearHit();
    comp.addTrigger(this);
  }
  
  // Send off the transition event to swap levels
  public void trigger() {
    
    if ( !this.hasActivated() ) {
      
      display.setTransition(true);
      dispatcher.dispatch(new LevelTransitionEvent(level_name, level_name.getDescription()));
      
      triggerEvents();
      
      if (DEBUG.EVENT_LOGGING) println("Transitioning to level: " + this.level_name.getDescription());
      
    }
          
  }
  
}