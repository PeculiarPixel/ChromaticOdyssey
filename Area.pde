
/* Class to represent areas of space
*  Extended by triggers, hitboxes, ect
*/
abstract class Area {
  
  protected float xPos;
  protected float yPos;
  protected float w;
  protected float h;
  protected color showColor;
  protected AreaTypeEnum designation;
  
  protected boolean isHitX;  // Hit detection for X axis
  protected boolean isHitY;  // Hit detection for Y axis
  
  // Designation constructor
  Area(float x, float y, float w, float h, AreaTypeEnum d) {
    this.xPos = x;
    this.yPos = y;
    this.w = w;
    this.h = h;
    this.designation = d;
    
    // Initialize hit values to false
    this.isHitX = false;
    this.isHitY = false;
    
  }
  
  // Get X Position
  public float getXPos() { return this.xPos; }
  
  // Get Y Position
  public float getYPos() { return this.yPos; }
  
  // Set X Position
  public void setXPos(float pos) { this.xPos = pos; }
  
  // Set Y Position
  public void setYPos(float pos) { this.yPos = pos; }
  
  // Get Width
  public float getWidth() { return this.w; }
  
  // Set Width
  public void setWidth(float w) { this.w = w; } 
  
  // Get Designation
  public AreaTypeEnum getDesignation() { return this.designation; }
  
  // Get Height
  public float getHeight() { return this.h; }
  
  // Set Height
  public void setHeight(float h) { this.h = h; }
  
  // Set Color
  public void setColor(color c) { this.showColor = c; }
  
  // Hit detection getter setter - X axis
  public boolean getHitX() { return isHitX; }
  public void setHitX(boolean v) { this.isHitX = v; }
  
  // Hit detection getter setter - Y axis
  public boolean getHitY() { return isHitY; }
  public void setHitY(boolean v) { this.isHitY = v; }
  
  public boolean isHit() { return this.isHitY || this.isHitX; }
  
  // Clear hit
  public void clearHit() { clearHitX(); clearHitY(); }
  private void clearHitX() { this.isHitX = false; }
  private void clearHitY() { this.isHitY = false; }
  
  
  abstract void initialize();
  
}

// Type enumeration
enum AreaTypeEnum {
  LEVEL_HITBOX, DAMAGE_HITBOX,
  CHARACTER_HITBOX, DIALOG_TRIGGER,
  DAMAGE_TRIGGER, TRANSITION_TRIGGER;
}