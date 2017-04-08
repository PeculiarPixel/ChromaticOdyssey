// Camera to follow Newt around
class GameCamera {
  
  // View size
  public float view_width;
  public float view_height;
  
  // Target to track
  private GameCharacter target;

  // Target position
  private float targetX;
  private float targetY;
  
  // Camera position
  public float cameraXPos;
  public float cameraYPos;
  
  // Update damp speed
  private float smooth_time = .2f;
  
  // Min / Max clamp values
  public boolean YMaxEnabled = true;
  public float YMax = 0;
  public boolean YMinEnabled = true;
  public float YMin = 0;
  public boolean XMaxEnabled = true;
  public float XMax = 3500;
  public boolean XMinEnabled = true;
  public float XMin = 0;
  
  // Constructor
  public GameCamera() {
    this.view_width = width;
    this.view_height = height;
  }
  
  // Set track target
  public void setTrackTarget(GameCharacter character) {
    this.target = character;
  }
  
  public float getXPos() { return this.cameraXPos; }
  
  public float getYPos() { return this.cameraYPos; }
  
  // Setup level min & max values for camera
  public void setLevelSize(float minX, float maxX, float minY, float maxY) {
    this.XMin = minX + view_width / 2;
    this.XMax = maxX - view_width / 2;
    this.YMin = minY + view_height / 2;
    this.YMax = maxY - view_height / 2;
  }
  
  // Update and translate world based on camera view
  public void fixedUpdate() {
  
    //pushMatrix();
    
    // Get tracked target position
    this.targetX = this.target.getXPos();
    this.targetY = this.target.getYPos();
    
    // Set Vertical
    if (YMinEnabled && YMaxEnabled) targetY = clamp(target.getYPos(), YMin, YMax);
    else if (YMinEnabled) targetY = clamp(target.getYPos(), YMin, target.getYPos());
    else if (YMaxEnabled) targetY = clamp(target.getYPos(), target.getYPos(), YMax);
    
    // Set Horizontal
    if (XMinEnabled && XMaxEnabled) targetX = clamp(target.getXPos(), XMin, XMax);
    else if (XMinEnabled) targetX = clamp(target.getXPos(), XMin, target.getXPos());
    else if (XMaxEnabled) targetX = clamp(target.getXPos(), target.getXPos(), XMax);
    
    this.cameraXPos = targetX - 512;
    this.cameraYPos = targetY - 334;
    
    //translate(targetX, targetY);
    //popMatrix();
  
  }
  
    // Clamp values
  public float clamp(float val, float min, float max) {
    return Math.max(min, Math.min(max, val));
  }

}