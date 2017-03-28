class LevelHitbox extends Hitbox {
  
  // Level Hitbox Color
  private final color LEVEL_HITBOX_COLOR = color(255, 0, 0);

  // Constructor
  public LevelHitbox(float x, float y, float w, float h) {
    super(x, y, w, h, AreaTypeEnum.LEVEL_HITBOX);
    setColor(LEVEL_HITBOX_COLOR);
    comp.addToHitboxes(this);
  }
}