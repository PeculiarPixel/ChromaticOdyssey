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

}