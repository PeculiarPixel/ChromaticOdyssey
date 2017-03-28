// Hitbox class for hit detection
abstract class Hitbox extends Area {
 
  private boolean isHitX;  // Hit detection for X axis
  private boolean isHitY;  // Hit detection for Y axis
  
  // Default Constructor
  Hitbox(float x, float y, float w, float h, AreaTypeEnum designation)  {
    super(x, y, w, h, designation);
    
    // Initialize hit values to false
    this.isHitX = false;
    this.isHitY = false;
    
  }
  
  // Hit detection getter setter - X axis
  public boolean getIsHitX() { return isHitX; }
  public void setIsHitX(boolean v) { this.isHitX = v; }
  
  // Hit detection getter setter - Y axis
  public boolean getIsHitY() { return isHitY; }
  public void setIsHitY(boolean v) { this.isHitY = v; }

}