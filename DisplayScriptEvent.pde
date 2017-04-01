class DisplayScriptEvent extends DisplayEvent {
  
  // Add script
  private Script script; 

  // Script to display
  public DisplayScriptEvent(Script script) {
    this.script = script;
  }
  
  // Draw the current dialog script
  public void drawEvent() {
    
    // Set dialog window details
    fill(255,255,255);
    stroke(20);  
    fill(155,155,155);
    
    rectMode(CENTER);
    rect(width/2, height-100, width, height/4);
    textSize(36);
    fill(0,0,0);
    
     // Animate Dialog Text
     if( frameCount % 3 == 0 
         && saveSpot < talk.script.get(talk.currentLine).length() ) {          // Check for frame skips and if the current line has finished typing
         
      displayText += talk.script.get(talk.currentLine).charAt(saveSpot);       // Add the next character to the display text
      text(displayText,100,height-100);                                        // Display the text
      saveSpot++;                                                              // Set index to the next character of the current conversation line
      
    } else {                                                                   // Display the txt until player presses next
      
      text(displayText,100,height-100);                                        // Wait until the character presses next to continue
      
    }
  }
  
}