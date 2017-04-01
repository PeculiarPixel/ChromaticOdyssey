class ConversationLibrary {

    // Directory map of all the sprite animations
  private HashMap<String, String> ConversationDirPathMap;
  private HashMap<String, Script> Conversations;
  
  // Constructor
  public ConversationLibrary() {
    ConversationDirPathMap = new HashMap<String, String>(); 
    loadConversationDirPaths();
    loadConversations();
  }
  
  // Load conversation dir paths
  private void loadConversationDirPaths() {
    ConversationDirPathMap.put("EMERALD_FOREST", "levelScripts/LevelEmeraldForest");
    ConversationDirPathMap.put("CASTLE_APPROACH", "levelScripts/LevelCastleApproach");
    ConversationDirPathMap.put("TEST_0", "levelScripts/level0");
    ConversationDirPathMap.put("TEST_1", "levelScripts/level1");
  }
  
  // Load conversations
  private void loadConversations() {
  }
  
    // Return path for string
  private String getDirPathByKey(String pathKey) throws NoDirPathEntryFoundException {
      
    String path;  // Path of requested animation
      
      try {
         path = ConversationDirPathMap.get(pathKey).toString(); // Get path 
      } catch (NullPointerException npe) {
        throw new NoDirPathEntryFoundException(pathKey);     // No path found in library
      }
      
    return path;  // Return path
    
  }
  
  
  // Return designated SpriteAnimation using key of the path
  private Script getConversation(String pathKey) throws DirectoryNotFoundException, NoDirPathEntryFoundException {
    
    String path = getDirPathByKey(pathKey);                            // Get path from library
    PImage[] images = fileUtils.getSpriteAnimations(path);             // Get all the dialog designated
    
    Script script = new Script();     // Create the new SpriteAnimation
    
    return script;  // Return the script    
  }
  
  // Load level conversations
  public HashMap<String, Script> getLevelConversations(LevelName name) {
    
    // Map of levels conversations
    HashMap<String, Script> conversations = new HashMap<String, Script>();
    
    try {
      switch(name) {
        case EMERALD_FOREST:
            break;
        default:
          println("Dialog Script for Unknown Level Failed");
      }
    } catch (NoDirPathEntryFoundException e) {
      println(e.getLocalizedMessage());
    } catch (DirectoryNotFoundException e) {
      println(e.getLocalizedMessage());
    }
    
   
    return animations;
    
  }
}