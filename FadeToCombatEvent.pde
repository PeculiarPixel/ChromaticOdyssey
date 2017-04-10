class FadeToCombatEvent extends DisplayableEvent {
  
   private long timeSent = 0;
   
   private float alpha;           // Starting alpha value
   private float transitionFade;  // Starting fade value
   private GameCharacterName fightName;
   
   private final float DA = 4;  // Rate of alpha change
  
  // Constructor
  public FadeToCombatEvent(GameCharacterName boss) {
    super();
    
    this.alpha = 0;                              // Starting alpha
    this.transitionFade = 0;                     // Starting fade
    this.timeSent = System.currentTimeMillis();
    this.fightName = boss;
    
  }
  
  
  public void send() {
    fadeOut(); 
  }
  
  // Made screen fade out
  private void fadeOut() {
    
    long timeDraw = System.currentTimeMillis();
    long duration = (timeDraw - timeSent) / 1000;
    
    // Change alpha
    alpha += DA;
    
    // Fade settings
    fill(0,0,0, this.alpha);
    rectMode(CORNER);
    rect(0, 0, width, height);
    
    // Check if complete
    if (this.transitionFade < 255) {
      this.transitionFade = alpha + DA;
    } else {
      this.transitionFade = 255;
    }
    
    // Fade complete, begin transition to level & c
    if (this.alpha >= 255 && duration > 1) {
      dispatcher.dispatchClear(this);            // Clear event
      this.finish();                             // Mark as transitioning
      fightManager.startNewFight(this.fightName);  
    }
  }

}