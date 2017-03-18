class Dialog{
  public ArrayList<String> script;     //This is the scipt for the current conversation
  public int currentLine;              //This is the index used to pick each line out of the script
  // Constructor
  Dialog(String[] inputScript){ 
    currentLine=0;
    script = new ArrayList<String>();
    for(int i=0;i<inputScript.length;i++){
      script.add(inputScript[i]);
    }
  }  

}