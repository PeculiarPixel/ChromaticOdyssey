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
  public String nextLine() { 
    if (currentDialogFinished()) ++currentDialogIndex;
    return this.peekDialog().nextLine(); 
  }
  
  // Check if current dialog finished
  public boolean currentDialogFinished() { return this.dialogs.get(currentDialogIndex).isFinished(); }
  
  // Check current script finished
  public boolean isFinished() {   
      if ( this.currentDialogIndex == this.dialogs.size() - 1 ) return true;
      else return false; 
  }
  
  // Set the current convo index
  public void setDialog(int index) { this.currentDialogIndex = index; } 
  
  // Get current speaker
  public String getCurrentSpeaker() { return this.peekDialog().getAuthor(); }
  
  // Get current speaker image
  public PImage getCurrentSpeakerImage() { return this.peekDialog().getAuthorImage(); }
  
  public int getCurrentDialogSize() { return peekDialog().getSize(); }
    
}