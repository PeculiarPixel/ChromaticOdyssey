class GlobalInfo {

  private int maxHealth;      // max health, increases if level up or stat changes
  private int maxExperience;  // amount needed to level up, incremented upwards each time you level
  private int maxMana;        // max character mana

  private SpriteAnimation idleUpAnimation;     // Idle Animation
  private SpriteAnimation idleDownAnimation;     // Idle Animation
  private SpriteAnimation idleLeftAnimation;     // Idle Animation
  private SpriteAnimation idleRightAnimation;     // Idle Animation
  private SpriteAnimation walkUpAnimation;     // Walk Animation
  private SpriteAnimation walkDownAnimation;     // Walk Animation
  private SpriteAnimation walkLeftAnimation;     // Walk Animation
  private SpriteAnimation walkRightAnimation;     // Walk Animation
  
  private SpriteAnimation currentAnimation;  // Current animation
  
  public AudioPlayer footstep;
  
  
  
  // Constructor
  public GlobalInfo(int h, int e, int m, ArrayList<SpriteAnimation> animations) {
      
      this.maxHealth = h;
      this.maxExperience = e;
      this.maxMana = m;
      
      loadAnimations(animations);  // Load characters animations
      
    }
    
    
  // Load character animations
  private void loadAnimations(ArrayList<SpriteAnimation> animations) {
    
    this.idleUpAnimation = animations.get(IDLE_UP_ANIMATION_INDEX);
    this.idleDownAnimation = animations.get(IDLE_DOWN_ANIMATION_INDEX);
    this.idleLeftAnimation = animations.get(IDLE_LEFT_ANIMATION_INDEX);
    this.idleRightAnimation = animations.get(IDLE_RIGHT_ANIMATION_INDEX);
    this.walkUpAnimation = animations.get(WALK_UP_ANIMATION_INDEX);
    this.walkDownAnimation = animations.get(WALK_DOWN_ANIMATION_INDEX);
    this.walkLeftAnimation = animations.get(WALK_LEFT_ANIMATION_INDEX);
    this.walkRightAnimation = animations.get(WALK_RIGHT_ANIMATION_INDEX);
    
    this.currentAnimation = idleDownAnimation;  // Set current animation to idle when loaded
    
  }

  // Update sprite animation based on direction
  public void updateSpriteDirection(MoveDirection direction) {
    
    // Reset current animation counts
      resetAnimation(this.currentAnimation);
      
    switch (direction) {
      case LEFT:
          this.currentAnimation = walkLeftAnimation;
          break;
      case RIGHT:
        this.currentAnimation = walkRightAnimation;
        break;
      case UP:
        this.currentAnimation = walkUpAnimation;
        break;
      case DOWN:
        this.currentAnimation = walkDownAnimation;
        break;
      case IDLE_UP:
        this.currentAnimation = idleUpAnimation;
        break;
      case IDLE_DOWN:
        this.currentAnimation = idleDownAnimation;
        break;
      case IDLE_LEFT:
        this.currentAnimation = idleLeftAnimation;
        break;
      case IDLE_RIGHT:
        this.currentAnimation = idleRightAnimation;
        break;
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