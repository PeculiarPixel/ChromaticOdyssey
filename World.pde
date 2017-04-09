public class World {
  
  private LevelLoader Loader;
  
  private Level currentLevel;                                      // Current Level
  private HashMap<GameCharacterName, GameCharacter> characters;    // Collection of all characters
  private HashMap<LevelName, Level> levels;                        // Collection of all levels
  private boolean gameStarted = false;                             // Boolean if the game has started
  
  private boolean mythra_defeated = false;
  private boolean game_finished = false;
  
  private Test_Level_0 test_0;
  private Test_Level_1 test_1;
  private LevelEmeraldForest Level_Emerald_Forest;
  private LevelEmeraldForestCave Level_Emerald_Forest_Cave;
  private LevelCastleApproach Level_Castle_Approach;
  private LevelCastleCourtyard Level_Castle_Courtyard;
  private LevelMasterBedroom Level_Master_Bedroom;
  private LevelKitsBedroom Level_Kits_Bedroom;
  private LevelLibrary Level_Library;
  private LevelLuminousRuinHub Level_Luminous_Ruin_Hub;
  private LevelSpire Level_Spire;
  private LevelThroneRoom Level_Throne_Room;
  private LevelWorldPrismInner Level_World_Prism_Inner;
  private LevelIntro Level_Intro;
  
  // Constructor
  public World() {
   
    // Setup characters & levels
    setupCharacters();
    setupLevels();
    
    // Setup level loader
    Loader = new LevelLoader();
    
  }
  
  // Load the level map
  private void setupLevels() {
    
    this.levels = new HashMap<LevelName, Level>();
    this.levels.put(LevelName.TEST_0, test_0);
    this.levels.put(LevelName.TEST_1, test_1);
    this.levels.put(LevelName.EMERALD_FOREST, Level_Emerald_Forest);
    this.levels.put(LevelName.EMERALD_FOREST_CAVE, Level_Emerald_Forest_Cave);
    this.levels.put(LevelName.CASTLE_APPROACH, Level_Castle_Approach);
    this.levels.put(LevelName.CASTLE_COURTYARD, Level_Castle_Courtyard);
    this.levels.put(LevelName.MASTER_BEDROOM, Level_Master_Bedroom);
    this.levels.put(LevelName.KIT_BEDROOM, Level_Kits_Bedroom);
    this.levels.put(LevelName.LIBRARY, Level_Library);
    this.levels.put(LevelName.CASTLE_HUB, Level_Luminous_Ruin_Hub);
    this.levels.put(LevelName.SPIRE, Level_Spire);
    this.levels.put(LevelName.THRONE_ROOM, Level_Throne_Room);
    this.levels.put(LevelName.WORLD_PRISM_INNER, Level_World_Prism_Inner);
    this.levels.put(LevelName.INTRO, Level_Intro);
    
  }
  
  // Setup characters
  private void setupCharacters() {
    newt = new GameCharacter(GameCharacterName.NEWT);
    kit = new GameCharacter(GameCharacterName.KIT);
    //mythra = new GameCharacter(GameCharacterName.MYTHRA);
    //pragma = new GameCharacter(GameCharacterName.PRAGMA);
  }
  
  // Unload a level from memory
  public void unloadLevel(LevelName name) {
    levels.put(name, null);
  }
  
  // Accessors
  public Level getCurrentLevel() {
    return currentLevel;
  }
  
  // Get specific level by given name
  public Level getLevel(LevelName name) {
    
    Level level = levels.get(name);
    
    // If level not yet loaded, load & readd to map
    if (level == null) {
      level = Loader.load(name);
      levels.put(name, level);
    }
    
    // Return requested level
    return level;
    
  }
  
  // Set Mythra boss to be defeated 
  public void setMythraDefeated() { this.mythra_defeated = true; }
  
  // Set game to be finished
  public void setGameFinished() { this.game_finished = true; }
  
  // Check if mythra is defeated
  public boolean isMythraDefeated() { return this.mythra_defeated; }
  
  // Check if game is finished
  public boolean isGameFinished() { return this.game_finished; }
  

}