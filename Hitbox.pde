class Hitbox{
  private float xPos;
  private float yPos;
  private float hitWidth;
  private float hitHeight;
  private color showColor;
  private String designation;
  private boolean isHitX;
  private boolean isHitY;
  private int conversationIndex;
  /*void display(){
   fill(255,255,255);
    stroke(10);  
    fill(this.showColor, 100);
    rectMode(CENTER);
    rect(xPos, yPos, hitWidth, hitHeight);
  }*/
  
   
  
    Hitbox(float x, float y, float w, float h, color c, String t, int number){
    this.xPos = x;
    this.yPos = y;
    this.hitWidth = w;
    this.hitHeight = h;
    this.showColor = c;
    this.designation = t;
    isHitX=false;
    isHitY=false;
    if(designation != "player"){
      comp.hitboxes.add(this);
    }
    if(t == "DialogBox"){
      conversationIndex = number;
    }else{
      conversationIndex = -1;
    }
  }
  
  
}