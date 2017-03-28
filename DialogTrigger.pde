class DialogTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int DIALOG_TRIGGER_COLOR = color(150, 150, 0);
  
  private int conversationIndex;

  // Constructor
  public DialogTrigger(float x, float y, float w, float h, int index) {
    super(x, y, w, h, AreaTypeEnum.DIALOG_TRIGGER);
    setColor(DIALOG_TRIGGER_COLOR);
    
    // Set dialog conversation index
    this.conversationIndex = index;
    
  }
  
}