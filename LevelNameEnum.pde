public enum LevelName {
  
  EMERALD_FOREST ("Emerald Forest"), 
  EMERALD_FOREST_CAVE ("Emerald Forest Cave"),
  KIT_PRISM_INNER ("...?"), 
  WORLD_PRISM_INNER ("Inside World Prism..."), 
  CASTLE_APPROACH ("Approaching the Castle"), 
  CASTLE_COURTYARD ("Castle Courtyard"),
  CASTLE_HUB ("Luminous Keep"), 
  LIBRARY ("The Library"), 
  THRONE_ROOM ("The Throne Room"), 
  MASTER_BEDROOM ("The Royal Chambers"), 
  KIT_BEDROOM ("Kit's Bedroom"),
  SPIRE ("The Spire"), 
  TEST_0 ("Test Level 0"), 
  TEST_1 ("Test Level 1"),
  INTRO (""),
  OUTRO (""),
  MYTHRA_DEFEATED(""),
  GAME_OVER ("");
  // Level transition description
  private String description;
  
  // Constructor
  private LevelName(String description) {
    this.description = description;
  }
  
  // Return level description
  public String getDescription() { return description; }
}