// Collection of Dialogs
class Script {

  // Collection of all associated dialogs for this scene
  private ArrayList<Dialog> dialogs;
  private int currentDialogIndex = 0;
  
  private String displayText = "";        // Display Text Value
  private int saveSpot = 0;               // Saved Character Spot Value
  
  // Standard Dialog Box Spacing Details
  private final int DIALOG_BOX_HEIGHT = 91;
  private final int DIALOG_BOX_WIDTH = 512;
  private final int DIALOG_TITLE_SIZE = 32;
  private final int DIALOG_CONTENT_SIZE = 28;
  private final int DIALOG_LEFT_PADDING = 40;
  private final int DIALOG_TITLE_BOTTOM_PADDING = 130;
  private final int DIALOG_CONTENT_BOTTOM_PADDING = 85;
  
  
  // Constructor
  public Script(ArrayList<Dialog> dialogs) {    
    this.dialogs = dialogs;
  }
  
  // Get the current dialog
  public Dialog peekDialog() { return this.dialogs.get(currentDialogIndex); }
  
  // Get the current dialog and move to next dialog
  public void next() {
    if (this.peekDialog().hasNext()) peekDialog().nextLine();
    else ++this.currentDialogIndex;
    this.saveSpot = 0;
    this.displayText = "";
  }
  
  // Check if current dialog finished
  public boolean currentDialogFinished() { return this.dialogs.get(currentDialogIndex).hasNext(); }
  
  // Check current script finished
  public boolean isFinished() {   
      if ( this.currentDialogIndex <= this.dialogs.size() - 1 ) return false;
      return true;
  }
  
  // Set the current convo index
  public void setDialog(int index) { this.currentDialogIndex = index; } 
  
  // Get current speaker
  public String getCurrentSpeaker() { return this.peekDialog().getAuthor(); }
  
  // Get current speaker image
  public PImage getCurrentSpeakerImage() { return this.peekDialog().getAuthorImage(); }
  
  public int getCurrentDialogSize() { return peekDialog().getSize(); }
  
  public void resetState() {
    resetDialogs();
    this.saveSpot = 0;
    this.displayText = "";
  }
  
  private void resetDialogs() {
    for (Dialog d : dialogs) {
      d.reset();
    }
  }
  
  
  public boolean draw() {
    
    if (this.isFinished()) {
      resetState();
      return true;
    }
    
    // Set dialog box to draw
    // Image size is always 1024 x 186
    imageMode(CENTER);
    image(peekDialog().getAuthorImage(), DIALOG_BOX_WIDTH, height - DIALOG_BOX_HEIGHT);

    textSize(28);
    fill(255, 255, 255);

         
     // Animate Dialog Text
     if( frameCount % 3 == 0 
         && this.saveSpot < peekDialog().getCurrentLine().length()) {          // Check for frame skips and if the current line has finished typing
         
      displayText += peekDialog().getCurrentLine().charAt(saveSpot);        // Add the next character to the display text
      
      text(displayText, DIALOG_LEFT_PADDING, height - DIALOG_CONTENT_BOTTOM_PADDING);                                   // Display the text
      saveSpot++;                                                         // Set index to the next character of the current conversation line
      
    } else {
      
      
      text(displayText, DIALOG_LEFT_PADDING, height - DIALOG_CONTENT_BOTTOM_PADDING);            // Display text
      
    }
    
    // Show author title
    textSize(32);
    text(peekDialog().getAuthor(), DIALOG_LEFT_PADDING, height - DIALOG_TITLE_BOTTOM_PADDING);
     
    
    return false;
    
  }
    
}