class PlayerCharacter{
  
  private GlobalInfo global;
  private LocalInfo local;
    
    
  void displaySprite(){
    imageMode(CENTER);
    image(global.sprite,local.xPos ,local.yPos );
    if(local.hitboxDisplay){
      local.hitbox.display();
    }
  }
   
   
   
  void moveCheck(float xChange, float yChange){
    for(int i = 0; i < hitboxes.size(); i++){
      if(local.hitbox.xCollision(hitboxes.get(i), local.hitbox, xChange))
        xChange = 0;
      if(local.hitbox.yCollision(hitboxes.get(i), local.hitbox, yChange))
        yChange = 0;
    }
   /* if(local.xPos + xChange > width-(this.sizeWe/2) || this.xPos + xChange < (this.sizeW/2))    //tries to account for the size difference of two hitboxes, might not be needed
      xChange = 0;
    if(this.yPos + yChange > height-(this.sizeH/2) || this.yPos + yChange < (this.sizeH/2))
      yChange = 0;*/
    local.xPos += xChange;
    local.yPos += yChange;
/*    for(int i = 0; i < pickups.size(); i++)
    {
      boolean removed = false;
      
      if((removed == false) && xCollision(pickups.get(i).getHitbox(), this.charHitbox, xChange))
      {
        pickups.get(i).pickUp();
        pickups.remove(i);
        removed = true;
      }
      if((removed == false) && yCollision(pickups.get(i).getHitbox(), this.charHitbox, xChange))
      {
        pickups.get(i).pickUp();
        pickups.remove(i);
        removed = true;
      }
    }*/
    local.hitbox.xPos= local.xPos;
    local.hitbox.yPos= local.yPos;
  } 


  void move(float speed){
    
    if(local.moveUp){
      moveCheck(0.0,-speed);
    }
    if(local.moveDown){
      moveCheck(0.0,speed);
    }
    if(local.moveLeft){
      moveCheck(-speed,0.0);
    }
    if(local.moveRight){
      moveCheck(speed,0.0);
    }
    

  }
    
    PlayerCharacter(){
    global = new GlobalInfo(1,2,3);
    local = new LocalInfo(100,100,global.sprite.width,global.sprite.height,3,4,5);
    }
}