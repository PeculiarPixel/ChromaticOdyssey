class DrawUtilities {

  // Draw stroke text of size
  public void strokeText(String message, float x, float y, int size, int fade){ 
    textSize(size);
    fill(255,255,255,fade); 
    text(message, x-2, y); 
    text(message, x, y-2); 
    text(message, x+2, y); 
    text(message, x, y+2); 
    fill(0,0,0,fade); 
    text(message, x, y);
  } 
  
}