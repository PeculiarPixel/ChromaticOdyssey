class DisplayScriptEvent extends DisplayableEvent {
  
  // Add script
  private Script script; 
  private String displayText = "";

  // Script to display
  public DisplayScriptEvent(Script script) {
    super();
    this.script = script;
  }
  
  // Draw the current dialog script
  public void send() {
    
    // Set dialog window details
    fill(255,255,255);
    stroke(20);  
    fill(155,155,155);
    
    rectMode(CENTER);
    rect(width/2, height-100, width, height/4);
    textSize(36);
    fill(0,0,0);
    
     // Animate Dialog Text
     if( frameCount % 3 == 0 ) {                                               // Check for frame skips and if the current line has finished typing
         
      displayText += talk.script.get(talk.currentLine).charAt(saveSpot);       // Add the next character to the display text
      text(displayText, 100, height - 100);                                        // Display the text
      
      
    } else {                                                                   // Display the txt until player presses next
        text(displayText, 100, height - 100);                                        // Wait until the character presses next to continue
    }
    
  }
  
  
}