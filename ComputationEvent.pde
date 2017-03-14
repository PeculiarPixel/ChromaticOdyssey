abstract class ComputationEvent extends Event {
  
  // Constructor
  ComputationEvent() {
    this.type = EventTypeEnum.COMPUTATION;
  }
  
  abstract void compute(); 
  
}