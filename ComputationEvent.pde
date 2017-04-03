class ComputationEvent extends Event
{
  int value;               // Value to compute
  GameCharacter target;    // Target of value
  
  // Constructor
  ComputationEvent(int value, GameCharacter target)
  {
    type = "ComputationEvent";
    this.value = value;
    this.target = target;
  }  

}