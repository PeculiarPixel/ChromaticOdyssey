class DisplayScriptEvent extends DisplayableEvent {
  
  // Add script
  private Script script;

  // Script to display
  public DisplayScriptEvent(Script script) {
    super();
    this.script = script;
  }
  
  // Draw the current dialog script
  public void send() { 
      
     display.queueScript(script);
     dispatcher.dispatchClear(this);
     this.finish();
  }
  
}