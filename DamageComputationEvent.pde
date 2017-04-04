class DamageComputationEvent extends ComputationEvent {
  
  int damage_value;        // Value to compute
  GameCharacter target;    // Target of value

  // Constructor
  public DamageComputationEvent(int value, GameCharacter target) {
    this.damage_value = value;
    this.target = target;
  }
  
  // Damage the target
  public void send() {
    this.target.local.currHealth += this.damage_value;
  }
  
}