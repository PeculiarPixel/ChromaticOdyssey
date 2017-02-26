class Landscape{ //will extend this class into different landscapes if needed
ArrayList<Hitbox> hitboxes;
  private float xPos;  //the player's current position X
  private float yPos;  // the player's curent position Y
//ArrayList<Sprite> sprites; // possibly sprite_Animations
  void display(){
    hitboxes.get(0).display();
  }

Landscape(float x, float y,float sizeX, float sizeY){
  xPos = x;
  yPos = y;
  hitboxes =new ArrayList<Hitbox>();
  //sprites =new ArrayList<Sprite>();
  hitboxes.add(new Hitbox(x,  y, sizeX, sizeY, color(random(255), random(255),random(255)), "landscape"));
}
}