// Hitbox class for hit detection
abstract class Hitbox extends Area {
  
  // Default Constructor
  Hitbox(float x, float y, float w, float h, AreaTypeEnum designation)  {
    super(x, y, w, h, designation); 
  }
  
  // Initialize this hitbox in the comp engine
  public void initialize() {
    comp.addToHitboxes(this);
  }

}