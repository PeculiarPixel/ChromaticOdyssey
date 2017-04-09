// Landscape objects
class Landscape {
  
  protected LevelHitbox hitbox;                  // Hitboxes for object
  
  // Object position
  protected float xPos;
  protected float yPos;
  
  protected PImage object_image = null;

  // Constructor
  public Landscape(float x, float y,float sizeX, float sizeY) {
    
    this.xPos = x;
    this.yPos = y;
    this.hitbox = new LevelHitbox(x,  y, sizeX, sizeY);   
    
  }
  
  // Constructor
  public Landscape(float x, float y,float sizeX, float sizeY, PImage object_image) {
    
    this.xPos = x;
    this.yPos = y;
    this.hitbox = new LevelHitbox(x,  y, sizeX, sizeY);   
    this.object_image = object_image;
    
  }
  
  
  
  // Get the hitbox for this landscape object
  public LevelHitbox getHitbox() { return this.hitbox; }
  
  
  // Initialize object
  public void initialize() {
      comp.addToHitboxes(this.hitbox);
  }
  
  // Draw this landscape object
  public void draw() {
    
    if (object_image != null) {
      imageMode(CENTER);
      image(this.object_image, this.xPos, this.yPos);
    }
    if (newt.local.hitboxDisplay) {
    imageMode(CENTER);
    display.displayArea(hitbox);
    }
  }
  
  
}