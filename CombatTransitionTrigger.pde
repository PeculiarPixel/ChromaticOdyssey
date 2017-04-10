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
  
  // Constructor
  protected CombatTransitionTrigger(float x, float y, float w, float h, FightManager nextFight) 
  {
    super(x, y, w, h, AreaTypeEnum.TRANSITION_TRIGGER);
    setColor(TRANSITION_TRIGGER_COLOR);    
    this.nextFight = nextFight;
    
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
    
  }
  
  // Send off the transition event to swap levels
  public void trigger() 
  {  if(!hasActivated())
     {
      if (boss == null) {
          //fightManager = nextFight;
          inCombat = true;
      }
      else {
        dispatcher.dispatch(new FadeToCombatEvent(boss, prevState, xpos, ypos));
      }

       activate();
       if (DEBUG.EVENT_LOGGING) println("Transitioning to fight");
       
     }  
  }
  
}