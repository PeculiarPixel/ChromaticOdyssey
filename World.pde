class World {
  
  private Level currentLevel;                 // Current Level
  private ArrayList<Level> levels;         // Collection of all levels
  
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