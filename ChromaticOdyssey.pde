
PlayerCharacter newt;
boolean hitBoxMode = false;
ArrayList<Hitbox> hitboxes;

void setup(){
  size(1024, 768);

  background(0);
  frameRate(60);
  newt = new PlayerCharacter();
  
  hitboxes = new ArrayList<Hitbox>(); 
  hitboxes.add(new Hitbox(300, 150, 100, 50, color(255,0,0), "wall"));
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
  background(0);
  newt.displaySprite();

    newt.move(5.0);

  if(hitBoxMode){
    //newt.local.hitbox.display();
    newt.local.hitboxDisplay = true;
    for(int i=0;i<hitboxes.size();i++){
    hitboxes.get(i).display();
    }
  }
}