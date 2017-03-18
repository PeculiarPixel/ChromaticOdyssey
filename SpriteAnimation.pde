// Store animation frames of a specific character sprite
// More information on this process can be found at http://bit.ly/2mf8sP8 & http://bit.ly/2lVhujl
class SpriteAnimation {
  
  PImage[] sprites;                   // Collection of Sprites to animate
  int tickSpeed;                     // Animation tick rate
  
  int currentTime = 0;               // Current time
  long lastTick = 0;                 // Previous game tick
  int currentImage = 0;              // Currently displayed animation image
  
  // Constructor
  SpriteAnimation(PImage[] sprites, int tickSpeed) {
    this.sprites = sprites;           // Take in images for animation
    this.tickSpeed = tickSpeed;     // Set tick speed
  }
  
  // Cycle to next image in animation
  private void cycleImage() {
    currentImage = ((currentImage + 1) % sprites.length);
  }
  
  public void update(long currentTick) {
    
    // Update animation times
    this.currentTime += currentTick - this.lastTick;
    this.lastTick = currentTick;
    
    // Cycle animation if time has passed 
    if (this.currentTime >= this.tickSpeed) {
       cycleImage();
       this.currentTime = 0;
    }
    
  }
  
  // Get current image to display
  public PImage getCurrentImage() { return this.sprites[currentImage]; } 
  
}