// Store animation frames of a specific character sprite
// More information on this process can be found at http://bit.ly/2mf8sP8 & http://bit.ly/2lVhujl
class SpriteAnimation {
  
  int currentFrame = 0;              // Current animation frame
  int counter = 0;                   // Counter to keept track of frame rate
  
  PImage[] sprites;                 // Collection of Sprites
  
  // Constructor
  SpriteAnimation(PImage[] sprites) {
    this.sprites = sprites;        // Take in image path
  }
  
  // Update displaying frame
  public void update() {}
  
}