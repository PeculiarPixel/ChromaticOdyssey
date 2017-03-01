// Hold all character animations and load them when needed
public class SpriteAnimationLibrary {

  private HashMap AnimationDirPathMap;
  
  // Constructor
  SpriteAnimationLibrary() {
    AnimationDirPathMap = new HashMap();
    loadAnimationPaths();
  }
  
  private void loadAnimationPaths() {
    
    // Extend for all animation paths
    AnimationDirPathMap.put("NewtWalk", "data/SpriteAnimations/Newt/WalkAnimation");
    AnimationDirPathMap.put("NewtIdle", "data/SpriteAnimations/Newt/IdleAnimation");
    
    
  }
  
  // Return path for string
  public String getDirPathByKey(String pathKey) {
    return AnimationDirPathMap.get(pathKey).toString();
  }
  
}