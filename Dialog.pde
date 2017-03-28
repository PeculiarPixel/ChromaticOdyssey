// Dialog for character interactions
class Dialog {
  
  public ArrayList<String> script;     //This is the scipt for the current conversation
  public int currentLine;              //This is the index used to pick each line out of the script
  
  // Constructor
  public Dialog(String[] inputScript){ 
    
    // Initialize
    script = new ArrayList<String>();
    currentLine = 0;
    
    // Add each inputted dialog line to script
    for (String s : inputScript) {
      script.add(s);
    }
    
  }  

}