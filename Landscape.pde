class Landscape{ //will extend this class into different landscapes if needed
ArrayList<Hitbox> hitboxes;
  private float xPos;  //the player's current position X
  private float yPos;  // the player's curent position Y
//ArrayList<Sprite> sprites; // possibly sprite_Animations
  /*void display(){
    hitboxes.get(0).display();
  }*/

Landscape(float x, float y,float sizeX, float sizeY, String type){
  xPos = x;
  yPos = y;
  int r=255;
  int g=255;
  int b=255;
  hitboxes =new ArrayList<Hitbox>();
  //sprites =new ArrayList<Sprite>();
  if(type == "Landcape"){
     r = 0;
     g = 255;
     b = 0;
  }else if(type =="EventBox"){
     r = 255;
     g = 0;
     b = 0;
  }
  hitboxes.add(new Hitbox(x,  y, sizeX, sizeY, color(r, g,b), type));
}
}