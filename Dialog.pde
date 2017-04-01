// Dialog for character interactions
class Dialog {
  
  private ArrayList<String> lines;       // This is the scipt for the current conversation
  private int currentLine;              // This is the index used to pick each line out of the script
  private GameCharacterName author;     // The author of the person saying the event
  private Image image;                  // Image to display for the line
  private int dialogSize;
  
  // Constructor
  public Dialog(String[] inputScript) { 
    
    // Initialize
    lines = new ArrayList<String>();
    currentLine = 1;
    author = GameCharacterName.valueOf(inputScript[0].toUpperCase());
    
    // Add each inputted dialog line to script
    for (String s : Arrays.copyOfRange(inputScript, 1, inputScript.length)) {
      lines.add(s);
      dialogSize++;
    }
    
  } 
  
  // Return the current line
  public int getCurrentLine() { return currentLine; }
  
  // Get Author
  public GameCharacterName getAuthor() { return this.author; }
  
  // Get Author Image
  public Image getAuthorImage() { return this.image; }

  // Get dialog size
  public int getSize() { return this.dialogSize(); }
  
}