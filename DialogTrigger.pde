class DialogTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int DIALOG_TRIGGER_COLOR = color(150, 150, 0);
  private final int ACTIVATED_DIALOG_TRIGGER_COLOR = color(20, 20, 0);
  
  // Computation Event
  private DisplayScriptEvent dialogEvent;

  // Constructor
  public DialogTrigger(float x, float y, float w, float h, Script script) {
    super(x, y, w, h, AreaTypeEnum.DIALOG_TRIGGER);
    setColor(DIALOG_TRIGGER_COLOR);
    
    // Set dialog conversation index
    this.dialogEvent = new DisplayScriptEvent(script);
    
  }
  
  // Trigger
  public void trigger() {
    
      dispatcher.dispatch(dialogEvent);
      setColor(ACTIVATED_DIALOG_TRIGGER_COLOR);
      triggerEvents();
      
      this.isActive = true;  // Disarm dialog event (one time action)
      
      if (DEBUG.EVENT_LOGGING) print("Triggered Dialog Event\n");
  }
  
}