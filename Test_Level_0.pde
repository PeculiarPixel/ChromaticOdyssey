// Default Test Level 0
class Test_Level_0 extends Level {
  
  public Test_Level_0() {
    super();
    loadAssets();
  }

  public Level nextState() {
    comp.clearEvents();
    Test_Level_1 next = new Test_Level_1();
    return next;
  }
  
  public void setStartPosition() {}
  
  // Initialize all assets, characters, &c into comp engine
  public void initialize() {
    
    // Loop through all assets and add initialize them
    for (GameCharacter c : characters) { c.initialize(); }
    for (Landscape l : landscapes) { l.initialize(); }
    for (Trigger t : triggers) { t.initialize(); }
    for (Hitbox h : hitboxes) { h.initialize(); }
    
  }
  
  // Load level necessary characters
  private void loadCharacters() {
    
  }
  
  // Load all level landscapes (Hitboxes, Triggers, Objects)
  private void loadLandscapes() {
    
    
    this.triggers.add(new DialogTrigger(350, 350, 100, 100, 1));
    this.triggers.add(new LevelTransitionTrigger(300, 120, 100, 100, 1));
    this.landscapes.add(new Landscape(120, 120, 100, 100));
    this.landscapes.add(new Landscape(700, 120, 100, 100));
    
    this.characters.add(newt);
    
  }
  
  // Load level conversations
  private void loadConversations() {
  // Load test conversation
  try{
    this.conversations = fileUtils.getLevelConversations("levelScripts/level0");
   } catch (DirectoryNotFoundException e) {
        println(e.getLocalizedMessage());
    }
    
  }
  
  // Load all level related assets
  public void loadAssets() {
    
    this.hitboxImage = loadImage("hitboxLayer.png");    
    this.backgroundImage = loadImage("CastleWalkup.png");
    this.foregroundImage = loadImage("CastleWalkupTopLayer.png");
    
    loadLandscapes();
    loadConversations();
    loadCharacters();
    
  }
  
}