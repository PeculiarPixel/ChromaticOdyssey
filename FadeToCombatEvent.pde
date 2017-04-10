class FadeToCombatEvent extends DisplayableEvent {
  
   private long timeSent = 0;
   
   private float alpha;           // Starting alpha value
   private float transitionFade;  // Starting fade value
   private GameCharacterName fightName;
   private LevelName prevState;
   private int x_return = -1;
   private int y_return = -1;
   
   private final float DA = 4;  // Rate of alpha change
  
  // Constructor
  public FadeToCombatEvent(GameCharacterName boss, LevelName prevState, int x_return, int y_return) {
    super();
    
    this.alpha = 0;                              // Starting alpha
    this.transitionFade = 0;                     // Starting fade
    this.timeSent = System.currentTimeMillis();
    this.fightName = boss;
    this.prevState = prevState;
    this.x_return = x_return;
    this.y_return = y_return;
    
  }
  
  // Constructor
  public FadeToCombatEvent(GameCharacterName boss, LevelName prevState) {
    super();
    
    this.alpha = 0;                              // Starting alpha
    this.transitionFade = 0;                     // Starting fade
    this.timeSent = System.currentTimeMillis();
    this.fightName = boss;
    this.prevState = prevState;
    this.x_return = x_return;
    this.y_return = y_return;
    
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
      state.checkpoint.name = prevState;
      if (this.x_return != -1 && this.y_return != -1) state.checkpoint.setStart(this.x_return, this.y_return);
      fightManager.startNewFight(this.fightName);  
    }
  }

}