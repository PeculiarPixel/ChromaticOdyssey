class GlobalInfo{

  private int maxHealth;      // max health, increases if level up or stat changes
  private int maxExperience;  // amount needed to level up, incremented upwards each time you level
  private int maxMana;
  
  private PImage sprite;
  
    GlobalInfo(int h, int e, int m){
    maxHealth = h;
    maxExperience = e;
    maxMana = m;
    sprite = (loadImage("1.PNG"));
  
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