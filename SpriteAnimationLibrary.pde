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
    
    // Newt
    AnimationDirPathMap.put("NEWT_IDLE_UP", "SpriteAnimations/Newt/IdleAnimationUp");
    AnimationDirPathMap.put("NEWT_IDLE_DOWN", "SpriteAnimations/Newt/IdleAnimationDown");
    AnimationDirPathMap.put("NEWT_IDLE_LEFT", "SpriteAnimations/Newt/IdleAnimationLeft");
    AnimationDirPathMap.put("NEWT_IDLE_RIGHT", "SpriteAnimations/Newt/IdleAnimationRight");
    AnimationDirPathMap.put("NEWT_WALK_UP", "SpriteAnimations/Newt/WalkAnimationUp");
    AnimationDirPathMap.put("NEWT_WALK_DOWN", "SpriteAnimations/Newt/WalkAnimationDown");
    AnimationDirPathMap.put("NEWT_WALK_LEFT", "SpriteAnimations/Newt/WalkAnimationLeft");
    AnimationDirPathMap.put("NEWT_WALK_RIGHT", "SpriteAnimations/Newt/WalkAnimationRight");
    
    // Kit
    AnimationDirPathMap.put("KIT_IDLE_UP", "SpriteAnimations/Kit/IdleAnimationUp");
    AnimationDirPathMap.put("KIT_IDLE_DOWN", "SpriteAnimations/Kit/IdleAnimationDown");
    AnimationDirPathMap.put("KIT_IDLE_LEFT", "SpriteAnimations/Kit/IdleAnimationLeft");
    AnimationDirPathMap.put("KIT_IDLE_RIGHT", "SpriteAnimations/Kit/IdleAnimationRight");
    AnimationDirPathMap.put("KIT_WALK_UP", "SpriteAnimations/Kit/WalkAnimationUp");
    AnimationDirPathMap.put("KIT_WALK_DOWN", "SpriteAnimations/Kit/WalkAnimationDown");
    AnimationDirPathMap.put("KIT_WALK_LEFT", "SpriteAnimations/Kit/WalkAnimationLeft");
    AnimationDirPathMap.put("KIT_WALK_RIGHT", "SpriteAnimations/Kit/WalkAnimationRight");
    AnimationDirPathMap.put("KIT_ATTACK", "SpriteAnimations/Kit/AttackAnimation");
    AnimationDirPathMap.put("KIT_HURT", "SpriteAnimations/Kit/HurtAnimation");
    
    
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
  
  public HashMap<String, SpriteAnimation> getCharacterAnimations(GameCharacterName name) {
  
    // Setup animations for character
    HashMap<String, SpriteAnimation> animations = new HashMap<String, SpriteAnimation>();
    
    try {
      switch(name) {
        case NEWT:
            animations.put("IDLE_UP", getSpriteAnimation("NEWT_IDLE_UP", IDLE_ANIMATION_RATE));
            animations.put("IDLE_DOWN", getSpriteAnimation("NEWT_IDLE_DOWN", IDLE_ANIMATION_RATE));
            animations.put("IDLE_LEFT", getSpriteAnimation("NEWT_IDLE_LEFT", IDLE_ANIMATION_RATE));
            animations.put("IDLE_RIGHT", getSpriteAnimation("NEWT_IDLE_RIGHT", IDLE_ANIMATION_RATE));
            animations.put("WALK_UP", getSpriteAnimation("NEWT_WALK_UP", WALK_ANIMATION_RATE));
            animations.put("WALK_DOWN", getSpriteAnimation("NEWT_WALK_DOWN", WALK_ANIMATION_RATE));
            animations.put("WALK_LEFT", getSpriteAnimation("NEWT_WALK_LEFT", WALK_ANIMATION_RATE));
            animations.put("WALK_RIGHT", getSpriteAnimation("NEWT_WALK_RIGHT", WALK_ANIMATION_RATE));
            break;
        case KIT:
            animations.put("IDLE_UP", getSpriteAnimation("KIT_IDLE_UP", IDLE_ANIMATION_RATE));
            animations.put("IDLE_DOWN", getSpriteAnimation("KIT_IDLE_DOWN", IDLE_ANIMATION_RATE));
            animations.put("IDLE_LEFT", getSpriteAnimation("KIT_IDLE_LEFT", IDLE_ANIMATION_RATE));
            animations.put("IDLE_RIGHT", getSpriteAnimation("KIT_IDLE_RIGHT", IDLE_ANIMATION_RATE));
            animations.put("WALK_UP", getSpriteAnimation("KIT_WALK_UP", WALK_ANIMATION_RATE));
            animations.put("WALK_DOWN", getSpriteAnimation("KIT_WALK_DOWN", WALK_ANIMATION_RATE));
            animations.put("WALK_LEFT", getSpriteAnimation("KIT_WALK_LEFT", WALK_ANIMATION_RATE));
            animations.put("WALK_RIGHT", getSpriteAnimation("KIT_WALK_RIGHT", WALK_ANIMATION_RATE));
        default:
          println("Character animations unknown");
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