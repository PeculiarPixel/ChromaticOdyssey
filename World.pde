public class World {
  
  private Level currentLevel;                                      // Current Level
  private HashMap<GameCharacterName, GameCharacter> characters;    // Collection of all characters
  private HashMap<LevelName, Level> levels;                        // Collection of all levels
  private boolean gameStarted = false;                             // Boolean if the game has started
  
  
  public World() {
    setupCharacters();
    setupLevels();
  }
  
  private void setupLevels() {
    
    this.levels = new HashMap<LevelName, Level>();
    this.levels.put(LevelName.TEST_0, new Test_Level_0());
    this.levels.put(LevelName.TEST_1, new Test_Level_1());
    this.levels.put(LevelName.EMERALD_FOREST, new LevelEmeraldForest());
    this.levels.put(LevelName.EMERALD_FOREST_CAVE, new LevelEmeraldForestCave());
    this.levels.put(LevelName.CASTLE_APPROACH, new LevelCastleApproach());
    this.levels.put(LevelName.CASTLE_COURTYARD, new LevelCastleCourtyard());
    this.levels.put(LevelName.MASTER_BEDROOM, new LevelMasterBedroom());
    this.levels.put(LevelName.KIT_BEDROOM, new LevelKitsBedroom());
    this.levels.put(LevelName.LIBRARY, new LevelLibrary());
    this.levels.put(LevelName.CASTLE_HUB, new LevelLuminousRuinHub());
    this.levels.put(LevelName.SPIRE, new LevelSpire());
    this.levels.put(LevelName.THRONE_ROOM, new LevelThroneRoom());
    this.levels.put(LevelName.WORLD_PRISM_INNER, new LevelWorldPrismInner());
    
  }
  
  
  private void setupCharacters() {
    newt = new GameCharacter(GameCharacterName.NEWT);
    //kit = new GameCharacter(GameCharacterName.KIT);
  }
  
  // Accessors
  public Level getCurrentLevel() {
    return currentLevel;
  }
  
  // Get specific level by given name
  public Level getLevel(LevelName name) {
    return levels.get(name);
  }
  
  public Level getMainMenu() { return null; }

}