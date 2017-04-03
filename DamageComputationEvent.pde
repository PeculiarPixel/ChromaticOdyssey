class DamageComputationEvent extends ComputationEvent {
  
  int damage_value;        // Value to compute
  GameCharacter target;    // Target of value

  // Constructor
  public DamageComputationEvent(int value, GameCharacter target) {
    super();
  }
  
  // Damage the target
  public void compute() {
    this.target.local.currHealth += this.damage_value;
  }
  
}