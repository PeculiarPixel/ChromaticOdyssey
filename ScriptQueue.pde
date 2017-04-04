class ScriptQueue  {

  private ScriptNode first;
  private ScriptNode last;
  private int size;
  
  // Constructor
  public ScriptQueue() {
    first = null;
    last = null;
    size = 0;
  } 
  
  // Script node
  private class ScriptNode {
    public Script item;
    public ScriptNode next;
  }
  
  // Check if script queue empty
  public boolean isEmpty() { return (first == null); }
  
  // Return number of scripts in queue
  public int scriptCount() { return size; }
  
  // Return first script in list
  public Script peek() throws NoSuchElementException {
    if (isEmpty()) throw new NoSuchElementException();
    return first.item; 
  }
  
  // Queue new script
  public void enqueue(Script s) {
    ScriptNode temp = last;
    last = new ScriptNode();
    last.item = s;
    last.next = null;
    if (isEmpty()) first = last;
    else temp.next = last;
    size++;
  }
  
  // Draw the current script
  public void draw() {
    if (!isEmpty()) {
      if(first.item.draw()) {
        try {
          next();
        } catch (NoSuchElementException e) {}
      }
    }
  }
  
  // Go through the script
  public void updateCurrentScript() {
    if (!isEmpty()) first.item.next();
  }
  
  
  // Get the next script at the head
  public Script next() throws NoSuchElementException {
    if (isEmpty()) throw new NoSuchElementException();
    Script item = first.item;
    first = first.next;
    size--;
    if (isEmpty()) last = null;
    return item;
  }
  
  // Clear all the references
  public void clearScripts() {
    first = null;
    last = null;
    size = 0;
  }

}

// No element in queue
public class NoSuchElementException extends Exception {
  public NoSuchElementException() { super("Queue Empty"); }
  public NoSuchElementException(String msg) { super(msg); }
}