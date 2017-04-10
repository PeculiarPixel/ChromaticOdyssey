import ddf.minim.*;

class SoundLibrary {
  
  private HashMap<String, AudioPlayer> level_themes;    // Level theme songs
  private HashMap<String, AudioPlayer> effects_list;    // Sound effects
  
  // Tracks to load
  
  // Level themes
  private AudioPlayer castle_approach_theme;
  private AudioPlayer master_bedroom_theme;
  private AudioPlayer luminous_ruin_theme;
  private AudioPlayer spire_theme;
  private AudioPlayer throne_room_theme;
  
  // Combat tracks
  private AudioPlayer mythra_fight_theme;
  private AudioPlayer pragma_fight_theme;
  
  // Currently playing track
  private AudioPlayer current_track;
  
  // Constructor
  public SoundLibrary() {
    
    this.level_themes = new HashMap<String, AudioPlayer>();      // Theme songs
    this.effects_list = new HashMap<String, AudioPlayer>();   // Sound effects
    
    // Load sounds
    loadLevelThemes();
    loadEffects();
    
  }
  
  // Load theme songs
  private void loadLevelThemes() {
    
    // Load themes
    this.castle_approach_theme = minim.loadFile("Sounds/LevelThemes/CastleApproach.wav");
    this.master_bedroom_theme = minim.loadFile("Sounds/LevelThemes/MasterBedroom.wav");
    this.luminous_ruin_theme = minim.loadFile("Sounds/LevelThemes/LuminousRuinHub.wav");
    this.throne_room_theme = minim.loadFile("Sounds/LevelThemes/ThroneRoomTheme.wav");
    this.spire_theme = minim.loadFile("Sounds/LevelThemes/SpireTheme.wav");
    this.mythra_fight_theme = minim.loadFile("Sounds/LevelThemes/MythraFightFull.wav");
    this.pragma_fight_theme = minim.loadFile("Sounds/LevelThemes/PragmaFightTheme.wav");
    
    // Set themes
    this.level_themes.put("CASTLE_APPROACH", castle_approach_theme);
    this.level_themes.put("MASTER_BEDROOM", master_bedroom_theme);
    this.level_themes.put("CASTLE_HUB", luminous_ruin_theme);
    this.level_themes.put("THRONE_ROOM", throne_room_theme);
    this.level_themes.put("SPIRE", spire_theme);
    this.level_themes.put("MYTHRA_FIGHT", mythra_fight_theme);
    this.level_themes.put("PRAGMA_FIGHT", pragma_fight_theme);
    
  }
  
  // Load sound effects
  private void loadEffects() {}
  
  // Play specified level theme
  public void playLevelTheme(LevelName theme_name) { 
    
    AudioPlayer theme = this.level_themes.get(theme_name.toString());
    
    if (theme != null) {
      stopCurrentTrack();
      this.current_track = theme;
      this.current_track.loop();
    }
    
  }
  
  public void playLevelTheme(String theme_name) {
  
    AudioPlayer theme = this.level_themes.get(theme_name);
    
    if (theme != null) {
      stopCurrentTrack();
      this.current_track = theme;
      this.current_track.loop();
    }
  
  } 
  
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