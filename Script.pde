// Collection of Dialogs
class Script {

  // Collection of all associated dialogs for this scene
  private ArrayList<Dialog> dialogs;
  private int currentDialogIndex = 0;
  
  private String displayText = "";
  private int saveSpot = 0;
  
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
      println("finished");
      return true;
    }
    
    // Set dialog window details
    fill(255,255,255);
    stroke(20);  
    fill(155,155,155);
    rectMode(CENTER);
    rect(width/2, height-100, width, height/4);
    textSize(36);
    fill(0,0,0);
    
    //println(currentDialogIndex);
     
    
    //println("SaveSpot: " + saveSpot);
    //     println(peekDialog().getCurrentLine().length());
         
     // Animate Dialog Text
     if( frameCount % 3 == 0 
         && this.saveSpot < peekDialog().getCurrentLine().length()) {          // Check for frame skips and if the current line has finished typing
         
         
         //println("printing");
         
      displayText += peekDialog().getCurrentLine().charAt(saveSpot);                       // Add the next character to the display text
      text(displayText, 100, height - 100);                                   // Display the text
      saveSpot++;                                                         // Set index to the next character of the current conversation line
      
    } else {
      
      text(displayText, 100, height - 100);            // Display text
      
    }
    
    text(peekDialog().getAuthor(), 50, height - 150);  // Show author
     
    
    return false;
    
  }
    
}