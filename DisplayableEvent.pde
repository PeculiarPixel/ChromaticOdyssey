abstract class DisplayableEvent extends Event {
  
  // Test for finished event
  private boolean isFinished = false;

  // Constructor
  public DisplayableEvent() {
    super(EventTypeEnum.DISPLAY);    
  }
  
  // Test if display event finished
  public boolean isFinished() { return this.isFinished; }
  
}