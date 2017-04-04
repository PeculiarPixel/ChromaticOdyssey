// Dialog for character interactions
class Dialog {
  
  private ArrayList<String> lines;       // This is the scipt for the current conversation
  private int currentLine = 0;              // This is the index used to pick each line out of the script
  private int currentChar = 0;
  private String author;     // The author of the person saying the event
  private PImage image;                  // Image to display for the line
  private int dialogSize;
  
  // Constructor
  public Dialog(String author, String image_key, ArrayList<String> content) { 
    
    // Initialize
    this.author = author; 
    this.lines = content;
    this.dialogSize = content.size();
    
  } 
  
  
  // Check if dialog is finished
  public boolean hasNext() { 
    if (this.currentLine < this.lines.size() - 1) return true; 
    return false; 
  }
  
  // Return the current line
  public int getCurrentLineLength() { return currentLine; }
  
  // Return the current line
  public String getCurrentLine() { return this.lines.get(currentLine); }
  
  // Get next line
  public void nextLine() {
    this.currentLine++; 
  }
  
  // Get Author
  public String getAuthor() { return this.author; }
  
  // Get Author Image
  public PImage getAuthorImage() { return this.image; }

  // Get dialog size
  public int getSize() { return this.lines.size(); }
  
  // Reset positions of the dialog indicies
  public void reset() {
    this.currentLine = 0;
    this.currentChar = 0;
  }
  
}