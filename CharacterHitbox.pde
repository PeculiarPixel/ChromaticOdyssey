class CharacterHitbox extends Hitbox {
  
  private final color CHARACTER_HITBOX_COLOR = color(0, 255, 0);

  // Constructor
  public CharacterHitbox(float x, float y, float w, float h) {
    super(x, y, w, h, AreaTypeEnum.CHARACTER_HITBOX);
    setColor(CHARACTER_HITBOX_COLOR);
  }
  
}