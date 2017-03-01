// I/O utilities class for getting images
class FileUtils {

  // Get a SpriteAnimationCycle given a filePath
  public PImage[] getSpriteAnimations(String dirPath)  throws DirectoryNotFoundException {
   
    File[] animationFiles = getFileListOfDirectory(dirPath);     // Get files
    PImage[] sprites = new PImage[animationFiles.length];        // Sprite collection
    
    // Load all images into the sprite array
    for (int i = 0; i < animationFiles.length; i++) {
      sprites[i] = loadImage(animationFiles[i].getName());
    }
    
    return sprites;    // Return the array of sprites
    
  }
  
  // Setup a file collection from dir path
  private File[] getFileListOfDirectory(String dirPath) throws DirectoryNotFoundException {
    
      File dir = new File(dirPath);  // Get directory by path
      
      // Get all files for animation lib
      if (dir.isDirectory()) {
        File[] files = dir.listFiles();
        return files;
      } 
      
      throw new DirectoryNotFoundException();
      
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