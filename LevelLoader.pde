// Handle loading levels dynamically when called for to offset load times
public class LevelLoader {
  
  // If called for level not loaded, instantiate it
  public Level load(LevelName name) {
    
    Level level = null;
      
      // Load level by name
      switch(name) {
        case TEST_0:
          level = new Test_Level_0();
          break;
        case TEST_1:
          level = new Test_Level_1();
          break;
        case EMERALD_FOREST:
          level = new LevelEmeraldForest();
          break;
        case EMERALD_FOREST_CAVE:
          level = new LevelEmeraldForestCave();
          break;  
        case KIT_PRISM_INNER:
          level = new LevelKitPrismInner();
          break;    
        case WORLD_PRISM_INNER:
          level = new LevelWorldPrismInner();
          break;          
        case CASTLE_APPROACH:
          level = new LevelCastleApproach();
          break;          
        case CASTLE_COURTYARD:
          level = new LevelCastleCourtyard();
          break;          
        case CASTLE_HUB:
          level = new LevelLuminousRuinHub();
          break;       
        case LIBRARY:
          level = new LevelLibrary();
          break;    
        case THRONE_ROOM:
          level = new LevelThroneRoom();
          break;    
        case MASTER_BEDROOM:
          level = new LevelMasterBedroom();
          break;    
        case KIT_BEDROOM:
          level = new LevelKitsBedroom();
          break;    
        case SPIRE:
          level = new LevelSpire();
          break;    
        case INTRO:
          level = new LevelIntro();
          break;
        case GAME_OVER:
          level = new LevelGameOver();
          break; 
        case OUTRO:
          level = new LevelOutro();
          break; 
      }
    
    // Return level
    return level;
  }
  
}