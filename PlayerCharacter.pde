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
   
   

    
    PlayerCharacter(){
    global = new GlobalInfo(1,2,3);
    local = new LocalInfo(100,100,global.sprite.width,global.sprite.height,3,4,5);
    //comp.players.add(this);
    }
}