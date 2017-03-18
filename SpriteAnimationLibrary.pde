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
    AnimationDirPathMap.put("NewtIdleUp", "SpriteAnimations/Newt/IdleAnimationUp");
    AnimationDirPathMap.put("NewtIdleDown", "SpriteAnimations/Newt/IdleAnimationDown");
    AnimationDirPathMap.put("NewtIdleLeft", "SpriteAnimations/Newt/IdleAnimationLeft");
    AnimationDirPathMap.put("NewtIdleRight", "SpriteAnimations/Newt/IdleAnimationRight");
    AnimationDirPathMap.put("NewtWalkUp", "SpriteAnimations/Newt/WalkAnimationUp");
    AnimationDirPathMap.put("NewtWalkDown", "SpriteAnimations/Newt/WalkAnimationDown");
    AnimationDirPathMap.put("NewtWalkLeft", "SpriteAnimations/Newt/WalkAnimationLeft");
    AnimationDirPathMap.put("NewtWalkRight", "SpriteAnimations/Newt/WalkAnimationRight");
    
    
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
  public SpriteAnimation getSpriteAnimation(String pathKey, int ANIMATION_RATE) throws DirectoryNotFoundException, NoDirPathEntryFoundException {
    
    String path = getDirPathByKey(pathKey);                            // Get path from library
    PImage[] images = fileUtils.getSpriteAnimations(path);             // Get all the images designated
    
    SpriteAnimation animation = new SpriteAnimation(images, ANIMATION_RATE);     // Create the new SpriteAnimation
    
    return animation;  // Return the SpriteAnimationS    
  }
  
  public ArrayList<SpriteAnimation> getCharacterAnimations(GameCharacterName name) {
  
    // Setup animations for character
    ArrayList<SpriteAnimation> animations = new ArrayList<SpriteAnimation>(10);
    
    try {
      switch(name) {
        case NEWT:
          animations.add(IDLE_UP_ANIMATION_INDEX, getSpriteAnimation("NewtIdleUp", IDLE_ANIMATION_RATE));
          animations.add(IDLE_DOWN_ANIMATION_INDEX, getSpriteAnimation("NewtIdleDown", IDLE_ANIMATION_RATE));
          animations.add(IDLE_LEFT_ANIMATION_INDEX, getSpriteAnimation("NewtIdleLeft", IDLE_ANIMATION_RATE));
          animations.add(IDLE_RIGHT_ANIMATION_INDEX, getSpriteAnimation("NewtIdleRight", IDLE_ANIMATION_RATE));
          animations.add(WALK_UP_ANIMATION_INDEX, getSpriteAnimation("NewtWalkUp", WALK_ANIMATION_RATE));
          animations.add(WALK_DOWN_ANIMATION_INDEX, getSpriteAnimation("NewtWalkDown", WALK_ANIMATION_RATE));
          animations.add(WALK_LEFT_ANIMATION_INDEX, getSpriteAnimation("NewtWalkLeft", WALK_ANIMATION_RATE));
          animations.add(WALK_RIGHT_ANIMATION_INDEX, getSpriteAnimation("NewtWalkRight", WALK_ANIMATION_RATE));
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