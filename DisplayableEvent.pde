class DisplayableEvent extends Event {
  
  DisplayableEvent(){
    this.type = EventTypeEnum.DISPLAY;
    
  }
  
  public void send()
  {
    dispatcher.sendDisplayable(this);
  }
}