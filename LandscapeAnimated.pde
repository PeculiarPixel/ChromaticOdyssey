class LandscapeAnimated extends Landscape {
  
  protected HashMap<String, SpriteAnimation> animations;
  protected SpriteAnimation currentAnimation;
  
  // Constructor
  public LandscapeAnimated(float x, float y,float sizeX, float sizeY) {
      super(x, y, sizeX, sizeY);
  }
  
  // Draw animation
  public void draw() {
    imageMode(CENTER);
    image(currentAnimation.getCurrentImage(), this.xPos, this.yPos);
    if (newt.local.hitboxDisplay) display.displayArea(getHitbox());
    this.currentAnimation.update();
  }

}