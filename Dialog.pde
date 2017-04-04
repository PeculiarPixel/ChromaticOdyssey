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
  public boolean isFinished() { 
    if (this.currentLine == this.lines.size() - 1) return true; 
    else return false; 
  }
  
  // Get next char
  public char getNextChar() { return this.lines.get(currentLine).charAt(currentChar++); }
  
  // Return the current line
  public int getCurrentLine() { return currentLine; }
  
  // Get next line
  public String nextLine() {
    currentChar = 0;
    return this.lines.get(currentLine++); 
  }
  
  // Get Author
  public String getAuthor() { return this.author; }
  
  // Get Author Image
  public PImage getAuthorImage() { return this.image; }

  // Get dialog size
  public int getSize() { return this.lines.size(); }
  
}