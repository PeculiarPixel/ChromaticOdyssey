class LevelTransitionEvent extends DisplayableEvent {
  
   private StateEventFadeIn state;      // State to change to
   private String description = "";
   
   private float alpha;           // Starting alpha value
   private float transitionFade;  // Starting fade value
   
   private final float DA = 4;  // Rate of alpha change
  
  // Constructor
  public LevelTransitionEvent(LevelName state) {
    super();
   
    this.state = new StateEventFadeIn(state);    // State to transition to once fade complete
    this.alpha = 0;                              // Starting alpha
    this.transitionFade = 0;                     // Starting fade
    
  }
  
  // Constructor
  public LevelTransitionEvent(LevelName state, String description) {
    super();
   
    this.state = new StateEventFadeIn(state);    // State to transition to once fade complete
    this.alpha = 0;                              // Starting alpha
    this.transitionFade = 0;                     // Starting fade
    this.description = description;
    
  }

  // Send the fade in event
  public void send() {
    fadeOut(); 
  }
  
  // Made screen fade out
  private void fadeOut() {
    
    // Change alpha
    alpha += DA;
    
    // Fade settings
    fill(0,0,0, this.alpha);
    rectMode(CORNER);
    rect(0, 0, width, height);
    
    // Draw text
    textAlign(CENTER);
    drawUtils.strokeText(description, width/2, height/2, 48, (int) Math.floor(alpha));
    

    
    // Check if complete
    if (this.transitionFade < 255) {
      this.transitionFade = alpha + DA;
    } else {
      this.transitionFade = 255;
    }
    
    // Fade complete, begin transition to level & c
    if (this.alpha >= 255) {
      dispatcher.dispatch(state);        // Transition state when covered
      dispatcher.dispatchClear(this);    // Clear event
      this.finish();                     // Mark as transitioning
    }
  }

}