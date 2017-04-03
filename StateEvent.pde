class StateEvent extends Event {

 //Level currentState;      // Current state
  Level nextState;         // State to switch to
  
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
}