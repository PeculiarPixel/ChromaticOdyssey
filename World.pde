public class World {
  
  private Level currentLevel;                 // Current Level
  private ArrayList<Level> levels;            // Collection of all levels
  private boolean gameStarted = false;        // Boolean if the game has started
  
  
  public World() {
    setupCharacters();
    setupLevels();
  }
  
  private void setupLevels() {
    this.levels = new ArrayList<Level>();
    this.levels.add(new Test_Level_0());
    this.levels.add(new Test_Level_1());
    this.currentLevel = levels.get(0);
  }
  
  
  private void setupCharacters() {
    newt = new GameCharacter(GameCharacterName.NEWT);
    //kit = new GameCharacter(GameCharacterName.KIT);
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
  
  public Level getMainMenu() { return null; }

}