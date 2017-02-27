class ComputationEvent extends Event {
  int value;
  GameCharacter affectedCharacter;
  
  
  
  ComputationEvent(int number,GameCharacter guy){
    type = "ComputationEvent";
    value=number;
    affectedCharacter = guy;
  }  

}