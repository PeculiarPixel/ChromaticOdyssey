class Hitbox
{
  private float xPos;
  private float yPos;
  private float hitWidth;
  private float hitHeight;
  private color showColor;
  private String designation;
  
  
  void display(){
    fill(255,255,255);
    stroke(10);  
    fill(this.showColor, 100);
    rectMode(CENTER);
    rect(xPos, yPos, hitWidth, hitHeight);
    //rectMode(CORNER);
  }
  
  

  boolean xCollision(Hitbox hBox1, Hitbox hBox2, float xChange)
{
/*  if(hBox2.hitHeight > hBox1.hitHeight)        //Adjustment for size difference between hitboxes
  {
    Hitbox temp = hBox1;
    hBox1 = hBox2;
    hBox2 = temp;
  }*/
  if((hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2) &&
    (hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 + xChange &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2 + xChange))
    {
      return true;
    }
  else
    return false;
}

/*
 Returns a boolean of whether two hitboxes are intersecting or not in the y direction
 */
boolean yCollision(Hitbox hBox1, Hitbox hBox2, float yChange)
{
/*  if(hBox2.hitWidth > hBox1.hitWidth)        //Adjustment for size difference between hitboxes
  {
    Hitbox temp = hBox1;
    hBox1 = hBox2;
    hBox2 = temp;
  }*/
  if((hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2) &&
    (hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 + yChange &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2 + yChange))
    {
      return true;
    }
  else
    return false;
}
  

  
   
  
  
    Hitbox(float x, float y, float w, float h, color c, String t){
    this.xPos = x;
    this.yPos = y;
    this.hitWidth = w;
    this.hitHeight = h;
    this.showColor = c;
    this.designation = t;
  }
  
  
}