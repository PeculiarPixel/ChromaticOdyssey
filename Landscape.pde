class Landscape {
  
  private ArrayList<Hitbox> hitboxes;  // hitboxes for landscape
  private float xPos;                  // the player's current position X
  private float yPos;                  // the player's curent position Y

  public Landscape(float x, float y,float sizeX, float sizeY){
    
    this.xPos = x;
    this.yPos = y;
    this.hitboxes =new ArrayList<Hitbox>();    
    this.hitboxes.add(new LevelHitbox(x,  y, sizeX, sizeY));
    
  }
  
  
  public void initialize() {
    for (Hitbox h : hitboxes) {
      comp.addToHitboxes(h);
    }
  }
  
  
}