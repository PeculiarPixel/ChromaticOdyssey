class GlobalInfo {

  private int maxHealth;      // max health, increases if level up or stat changes
  private int maxExperience;  // amount needed to level up, incremented upwards each time you level
  private int maxMana;
  
  private PImage sprite;
  private SpriteAnimation walkAnimation;
  private SpriteAnimation idleAnimation;
  
    GlobalInfo(int h, int e, int m, ArrayList<SpriteAnimation> animations) {
      this.maxHealth = h;
      this.maxExperience = e;
      this.maxMana = m;
      this.sprite = (loadImage("1.PNG"));
      this.walkAnimation = animations.get(0);
      this.idleAnimation = animations.get(1);
    }

  void updateSpriteDirection(MoveDirection direction) {
    switch (direction) {
      case LEFT:
          sprite = newtWalk.sprites[0];
          break;
        case RIGHT:
          sprite = newtWalk.sprites[0];
          break;
        case UP:
          sprite = newtWalk.sprites[1];
          break;
        case DOWN:
          sprite = newtWalk.sprites[1];
          break;
        case IDLE:
          sprite = (loadImage("1.PNG")); 
    }
  }
}