class GlobalInfo {

  private int maxHealth;      // max health, increases if level up or stat changes
  private int maxExperience;  // amount needed to level up, incremented upwards each time you level
  private int maxMana;        // max character mana

  private HashMap<String, SpriteAnimation> animations;  // Character Animations
  private SpriteAnimation currentAnimation;             // Current animation
  
  // Constructor
  public GlobalInfo(int h, int m, HashMap<String, SpriteAnimation> animations, GameCharacterName name) {
      
      this.maxHealth = h;
      this.maxMana = m;
      
      // Get all animations
      this.animations = animations;

      if(name == GameCharacterName.PRAGMA ||name == GameCharacterName.MYTHRA){
            this.currentAnimation = animations.get("IDLE_LEFT");
      }else{
            this.currentAnimation = animations.get("IDLE_DOWN");
      }
      
  }
    

  // Update sprite animation based on direction
  public void updateSpriteDirection(MoveDirection direction) {
          if(direction!=null){
    // Reset current animation counts
    resetAnimation(this.currentAnimation);
      
    switch (direction) {
      case LEFT:
          this.currentAnimation = animations.get("WALK_LEFT");;
          break;
      case RIGHT:
        this.currentAnimation = animations.get("WALK_RIGHT");
        break;
      case UP:
        this.currentAnimation = animations.get("WALK_UP");
        break;
      case DOWN:
        this.currentAnimation = animations.get("WALK_DOWN");
        break;
      case IDLE_UP:
        this.currentAnimation = animations.get("IDLE_UP");
        break;
      case IDLE_DOWN:
        this.currentAnimation = animations.get("IDLE_DOWN");
        break;
      case IDLE_LEFT:
        this.currentAnimation = animations.get("IDLE_LEFT");
        break;
      case IDLE_RIGHT:
        this.currentAnimation = animations.get("IDLE_RIGHT");
        break;
    }
          }
  }
  
  // Reset sprite animations to base
  public void resetAnimation(SpriteAnimation animation) {
    animation.resetAnimation();
  }
  
  // Update animation
  public void updateAnimation() {
    currentAnimation.update();
  }
  
  // Get current image
  public PImage getCurrentAnimationImage() { return this.currentAnimation.getCurrentImage(); }
}