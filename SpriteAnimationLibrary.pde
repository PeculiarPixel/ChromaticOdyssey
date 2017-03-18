// Hold all character animations and load them when needed
public class SpriteAnimationLibrary {

  private HashMap AnimationDirPathMap;
  private String basePath;
  
  // Constructor
  SpriteAnimationLibrary() {
    AnimationDirPathMap = new HashMap(); 
    loadAnimationPaths();
  }
  
  private void loadAnimationPaths() {
    
    // Extend for all animation paths
    AnimationDirPathMap.put("NewtWalk", "SpriteAnimations/Newt/WalkAnimation");
    AnimationDirPathMap.put("NewtIdle", "SpriteAnimations/Newt/IdleAnimation");
    
  }
  
  // Return path for string
  private String getDirPathByKey(String pathKey) throws NoDirPathEntryFoundException {
      
    String path;  // Path of requested animation
      
      try {
         path = AnimationDirPathMap.get(pathKey).toString(); // Get path 
      } catch (NullPointerException npe) {
        throw new NoDirPathEntryFoundException(pathKey);     // No path found in library
      }
      
    return path;  // Return path
    
  }
  
  
  // Return designated SpriteAnimation using key of the path
  public SpriteAnimation getSpriteAnimation(String pathKey) throws DirectoryNotFoundException, NoDirPathEntryFoundException {
    
    String path = getDirPathByKey(pathKey);                      // Get path from library
    PImage[] images = fileUtils.getSpriteAnimations(path);       // Get all the images designated
    SpriteAnimation animation = new SpriteAnimation(images, 100);     // Create the new SpriteAnimation
    
    return animation;  // Return the SpriteAnimationS    
  }
  
  public ArrayList<SpriteAnimation> getCharacterAnimations(GameCharacterName name) {
  
    // Setup animations for character
    ArrayList<SpriteAnimation> animations = new ArrayList<SpriteAnimation>();
    
    try {
      switch(name) {
        case NEWT:
          animations.add(getSpriteAnimation("NewtWalk"));
          animations.add(getSpriteAnimation("NewtIdle"));        
        default:
  
      }
    } catch (NoDirPathEntryFoundException e) {
      println(e.getLocalizedMessage());
    } catch (DirectoryNotFoundException e) {
      println(e.getLocalizedMessage());
    }
    
   
    return animations;
    
  }
  
}


// Exception for no entry found within the library for requested animation sprites
class NoDirPathEntryFoundException extends Exception {

  // Base Constructor
  public NoDirPathEntryFoundException() { super();  }
  
  // Constructor w/ Msg
  public NoDirPathEntryFoundException(String entry) {
    super("No animation library entry found for " + entry + "!");
  }
}