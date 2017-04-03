class StateEvent extends Event {
  
<<<<<<< HEAD
  StateEvent(Level nextState)
  {
    type = "StateEvent";
    this.nextState = nextState;
  }
  
}

class CombatEvent extends StateEvent
{
  FightManager fightManager;
  
  CombatEvent(Level nextState, FightManager fight)
  {
    super(nextState);
    type = "Fight";
    this.fightManager = fight;
  }
=======
  LevelName nextState;         // State to switch to
  
  // Constructor
  public StateEvent(LevelName nextState) {
    type = EventTypeEnum.STATE;
    this.nextState = nextState;
  }
  
  // Get level to transition to
  public LevelName getState() {
    return nextState;
  }
  
>>>>>>> refs/remotes/origin/master
}