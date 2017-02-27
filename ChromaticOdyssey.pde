import processing.video.*;


GameCharacter newt;
boolean hitBoxMode = false;
ComputationEngine comp;
StateEngine state;
DisplayEngine display;
Test_Level_0 beginning;  //we now set the beginning to level 0
void setup(){
  size(1024, 768);
  background(0);
  frameRate(60);
  newt = new GameCharacter();
  comp  = new ComputationEngine();
  comp.players.add(newt);
  state  = new StateEngine(beginning);
  display = new DisplayEngine();
}


void keyPressed() {

  //newt.inputPressed();
  if (keyCode == UP) {
    newt.local.moveUp = true;
  }
  if(keyCode == DOWN){
    newt.local.moveDown = true;
  }
  if(keyCode == LEFT){
   newt.local.moveLeft = true;
  }
  if(keyCode == RIGHT){
    newt.local.moveRight = true;
  }
}


//boolean hitBoxMode = false;

void keyReleased() {
  
//  newt.inputReleased();
if (keyCode == UP) {
    newt.local.moveUp = false;
  }
  if(keyCode == DOWN){
    newt.local.moveDown = false;
  }
  if(keyCode == LEFT){
   newt.local.moveLeft = false;
  }
  if(keyCode == RIGHT){
    newt.local.moveRight = false;
  }
  if(key == 'h' || key == 'H'){
      hitBoxMode = !hitBoxMode;
  }

}




void draw(){  
   state.run();
   comp.run();
   display.run();

}