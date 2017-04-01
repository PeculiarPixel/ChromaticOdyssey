abstract class DisplayableEvent extends Event {
  
  // Test for finished event
  private boolean isFinished = false;

  // Constructor
  public DisplayableEvent() {
    this.type = EventTypeEnum.DISPLAY;    
  }
  
  public void send()
  {
    dispatcher.sendDisplayable(this);
  }
 
  // Draw the displayable event
  abstract boolean drawEvent();
  
  // Test if display event finished
  public boolean isFinished() { return this.isFinished; }
  
}