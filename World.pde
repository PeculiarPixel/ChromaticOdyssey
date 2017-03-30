public class World {
  
  private Level currentLevel;                 // Current Level
  private ArrayList<Level> levels;            // Collection of all levels
  
  public World() {
    setupLevels(); 
  }
  
  private void setupLevels() {
    this.levels = new ArrayList<Level>();
    this.levels.add(new Test_Level_0());
    this.levels.add(new Test_Level_1());
    this.currentLevel = levels.get(0);
  }
  
  // Accessors
  public Level getCurrentLevel() {
    return currentLevel;
  }
  
  public ArrayList<Level> getLevels() {
    return levels;
  }
  
  // Get specific level by given index
  public Level getLevelByIndex(int index) {
    return levels.get(index);
  }

}