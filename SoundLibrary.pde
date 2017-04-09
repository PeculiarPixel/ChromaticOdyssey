import ddf.minim.*;

class SoundLibrary {
  
  private HashMap<String, AudioPlayer> level_themes;    // Level theme songs
  private HashMap<String, AudioPlayer> combat_themes;   // Combat songs
  private HashMap<String, AudioPlayer> effects_list;    // Sound effects
  
  // Tracks to load
  private AudioPlayer castle_approach_theme;
  private AudioPlayer master_bedroom_theme;
  private AudioPlayer luminous_ruin_theme;
  private AudioPlayer mythra_fight_theme;
  private AudioPlayer final_fight_theme;
  private AudioPlayer random_encounter_theme;
  
  // Currently playing track
  private AudioPlayer current_track;
  
  // Constructor
  public SoundLibrary() {
    
    this.level_themes = new HashMap<String, AudioPlayer>();      // Theme songs
    this.combat_themes = new HashMap<String, AudioPlayer>();      // Theme songs
    this.effects_list = new HashMap<String, AudioPlayer>();   // Sound effects
    
    // Load sounds
    loadLevelThemes();
    loadCombatThemes();
    loadEffects();
    
  }
  
  // Load theme songs
  private void loadLevelThemes() {
    
    // Load themes
    this.castle_approach_theme = minim.loadFile("Sounds/LevelThemes/CastleApproach.wav");
    this.master_bedroom_theme = minim.loadFile("Sounds/LevelThemes/MasterBedroom.wav");
    this.luminous_ruin_theme = minim.loadFile("Sounds/LevelThemes/LuminousRuinHub.wav");
    //this.mythra_fight_theme = minim.loadFile("a.wav");
    //this.final_fight_theme = minim.loadFile("a.wav");
    //this.random_encounter_theme = minim.loadFile("a.wav");
    
    // Set themes
    this.level_themes.put("CASTLE_APPROACH", castle_approach_theme);
    this.level_themes.put("MASTER_BEDROOM", master_bedroom_theme);
    this.level_themes.put("CASTLE_HUB", luminous_ruin_theme);
    
  }
  
  // Load sound effects
  private void loadEffects() {}
  
  // Load combat themes
  private void loadCombatThemes() {}
  
  // Play specified level theme
  public void playLevelTheme(LevelName theme_name) { 
    
    AudioPlayer theme = this.level_themes.get(theme_name.toString());
    
    if (theme != null) {
      this.current_track = theme;
      this.current_track.loop();
    }
    
  }
  
  // Play specified combat theme
  public void playCombatTheme(String combat_theme) {}
  
  // Stop the current theme
  public void stopCurrentTrack() { 
    if ( this.current_track != null ) {
      if  ( this.current_track.isPlaying() ) {
        this.current_track.pause();
        this.current_track.rewind();
      }
    }
  }
  
}