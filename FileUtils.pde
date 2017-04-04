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
  public ArrayList<Script> getLevelConversations(String dirPath) throws DirectoryNotFoundException {
    
    File[] levelConversationFiles = getFileListOfDirectory(dirPath);     // Get files
    ArrayList<Script> scripts = new ArrayList<Script>();      // Script collection

    // Load conversations
    for (File f : levelConversationFiles) {   
        
        ArrayList<Dialog> dialogs = new ArrayList<Dialog>();  // Create new dialog list        
        String[] lines = loadStrings(f.getAbsolutePath());    // Load lines from file
        int currentIndex;                                     // Save current index
        
        // For each line in file, sort out the authors and their content
        for(currentIndex = 0; currentIndex < lines.length;) {
         
          String[] descrip = lines[currentIndex].split("[\\s']");  // Split description
          ArrayList<String> content = new ArrayList<String>();     // Get content lines
          int content_limit = Integer.parseInt(descrip[2]);        // Get number of content lines
          
          // Add content
          int content_index;
          for(content_index = 1; content_index <= content_limit; content_index++) {
            content.add(lines[currentIndex + content_index]);
          }
          
          // Add to dialogs
          dialogs.add(new Dialog(descrip[0], descrip[1], content));
          // Increment index to next description line
          currentIndex += content_index;
          
          print("Adding new script with author " + descrip[0] + " image key " + descrip[1] + " and content:\n");
          for (String st : content) {
            println(st);
          }
            
        }
        
        // Add level script
        scripts.add(new Script(dialogs));
    }
    
    println("Got conversation from: " + dirPath);
    return scripts;
    
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