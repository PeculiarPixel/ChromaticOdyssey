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
      
      display.currentScript = this.script;
      //println("Displaying script");
      if (script.draw()) {
        dispatcher.dispatchClear(this);
        display.currentScript = null;
        finish();
        println("Clearing script");
     }
  
  }
  
  
  
}