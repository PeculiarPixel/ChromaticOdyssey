// I/O utilities class for getting images
class FileUtils {

  // Get a SpriteAnimationCycle given a filePath
  public PImage[] getSpriteAnimations(String dirPath)  throws DirectoryNotFoundException {
   
    File[] animationFiles = getFileListOfDirectory(dirPath);     // Get files
    PImage[] sprites = new PImage[animationFiles.length];        // Sprite collection
    
    // Load all images into the sprite array
    for (int i = 0; i < animationFiles.length; i++) {
      sprites[i] = loadImage(animationFiles[i].getAbsolutePath());
     // sprites[i].resize(sprites[i].width/3, sprites[i].height/3);
    }
    
    return sprites;    // Return the array of sprites
    
  }
  
  // Get a script from file
  public ArrayList<Dialog> getLevelConversations(String dirPath) throws DirectoryNotFoundException {
    
    File[] levelConversationFiles = getFileListOfDirectory(dirPath);     // Get files
    ArrayList<Dialog> levelConversations = new ArrayList<Dialog>();      // Script collection

    // Load conversations
    for (File f : levelConversationFiles) {      
        levelConversations.add(new Dialog(loadStrings(f.getAbsolutePath())));
    }
    
    println("Got conversation from: " + dirPath);
    return levelConversations;
    
  }
  
  
  
  // Setup a file collection from dir path
  private File[] getFileListOfDirectory(String dirPath) throws DirectoryNotFoundException {
    
      println(dataPath(dirPath));
    
      File dir = new File(dataPath(dirPath));  // Get directory by path
      
      // Get all files for animation lib
      if (dir.isDirectory()) {
        File[] files = dir.listFiles();
        return files;
      } 
      
      throw new DirectoryNotFoundException(dirPath);
      
  }

}

// Exception for not finding directory
class DirectoryNotFoundException extends Exception {
  
  // Super constructor
  DirectoryNotFoundException() { super(); }
  
  // Constructor
  DirectoryNotFoundException(String dirPath) {
    super("Directory of Animation Cycle " + dirPath + " not found!");
  }
  
}