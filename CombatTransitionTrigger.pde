class CombatTransitionTrigger extends Trigger {
  
  // Dialog Trigger color
  private final int TRANSITION_TRIGGER_COLOR = color(155, 0, 155);
  
  // Event to trigger when stepped on
  private FightManager nextFight;
  private FadeToCombatEvent event;
  private int xpos;
  private int ypos;
  private GameCharacterName boss;
  private LevelName prevState;
  
  private boolean hasTriggered;
  
  // Constructor
  protected CombatTransitionTrigger(float x, float y, float w, float h, FightManager nextFight) 
  {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.nextFight = nextFight;
    this.hasTriggered = false;
  }
  
  
  // Constructor
  protected CombatTransitionTrigger(float x, float y, float w, float h, GameCharacterName boss, LevelName prevState) 
  {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.xpos = (int) x;
    this.ypos = (int) y;
    this.boss = boss;
    this.prevState = prevState;
    this.hasTriggered = false;
  }
  
  // Send off the transition event to swap levels
  public void trigger() 
  {  if(!hasTriggered)
     {
      if (boss == null) {
          //fightManager = nextFight;
          inCombat = true;
          hasTriggered = true;
      }
      else {
        dispatcher.dispatch(new FadeToCombatEvent(boss, prevState, xpos, ypos));
         hasTriggered = true; 
      }

       if (DEBUG.EVENT_LOGGING) println("Transitioning to fight"); 
     }  
  }
  
}