class CombatTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(155, 0, 155);
  
  // Event to trigger when stepped on
  private FightManager nextFight;
  
  // Constructor
  protected CombatTransitionTrigger(float x, float y, float w, float h, FightManager nextFight) 
  {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.nextFight = nextFight;
  }
  
  // Send off the transition event to swap levels
  public void trigger() {
    
      fightManager = nextFight;
      inCombat = true;
      
      println("Transitioning to fight");
      
  }
  
}