class CombatTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(155, 0, 155);
  
  // Event to trigger when stepped on
  private FightManager nextFight;
  
  private boolean hasTriggered;
  
  // Constructor
  protected CombatTransitionTrigger(float x, float y, float w, float h, FightManager nextFight) 
  {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.nextFight = nextFight;
    this.hasTriggered = false;
  }
  
  // Send off the transition event to swap levels
  public void trigger() 
  {  if(!hasTriggered)
     {
      //fightManager = nextFight;
      inCombat = true;
      hasTriggered = true;
      println("Transitioning to fight"); 
     }  
  }
  
}