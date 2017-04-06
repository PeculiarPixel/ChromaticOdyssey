class LevelTransitionFadeInEvent extends DisplayableEvent {
  
   private int theta;                 // Theta value
   private float transitionFade;      // Fade value
   
   private final float DT = 4;        // Rate of fade in change
  
  // Constructor
  public LevelTransitionFadeInEvent() {
    super();
    
    // Fade in starting values
    this.theta = 255;
    this.transitionFade = 255;
    
  }
  
  // Send the fade in event
  public void send() {
      fadeIn();
  }
  
  // Fade in function
  private void fadeIn()  {
    
    // Change theta
    this.theta -= DT;
    
    
    // Set fill settings
    fill(0,0,0,theta);
    rectMode(CORNER);
    rect(0,0,width,height);
    
    // Draw text
    drawUtils.strokeText("FUK U",width/2,height/2,48,theta);
    
    
    // Check if faded 
    if(this.transitionFade > 0) {
      this.transitionFade = this.theta - this.DT;
    } else {
      this.transitionFade = 0;
    }

    // Fade in complete, 
    if (this.theta <= 0) {
      dispatcher.dispatchClear(this);    // Clear event
      display.setTransition(false);      // Turn off display transition setting
      this.finish();                     // Mark as finished
    }
    
} 


}