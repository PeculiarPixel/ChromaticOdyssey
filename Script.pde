// Collection of Dialogs
class Script {

  // Collection of all associated dialogs for this scene
  private ArrayList<Dialog> dialogs;
  private int currentDialogIndex = 0;
  
  // Constructor
  public Script(ArrayList<Dialog> dialogs) {
    this.dialogs = dialogs;
  }
  
  // Get the current dialog
  public Dialog peekDialog() { return this.dialogs.get(currentDialogIndex); }
  
  // Get the current dialog and move to next dialog
  public Dialog nextLine() { return this.dialogs.get(currentDialogIndex++); }
  
  // Set the current convo index
  public void setLine(int index) { this.currentDialogIndex = index; } 
  
  // Get current speaker
  public GameCharacterName getCurrentSpeaker() { return this.peekDialog().getAuthor(); }
  
  // Get current speaker image
  public Image getCurrentSpeakerImage() { return this.peekDialog().getAuthorImage(); }
  
  public int getCurrentDialogSize() { return peekDialog().getSize(); }
  
  public void writeText() {
  
  }
    
}