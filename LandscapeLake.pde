class LandscapeLake extends LandscapeAnimated {

  public LandscapeLake(float x, float y,float sizeX, float sizeY) {
    super(x, y, sizeX, sizeY);
    
    // Get lake animation
    this.animations = spriteLibrary.getObjectAnimation("LAKE");
    this.currentAnimation = animations.get("DEFAULT");
  }  


}