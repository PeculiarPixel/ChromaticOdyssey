class GameCharacter{
  
  private GlobalInfo global;
  private LocalInfo local;
    
    
/*  void displaySprite(){
    imageMode(CENTER);
    image(global.sprite,local.xPos ,local.yPos );
    if(local.hitboxDisplay){
      local.hitbox.display();
    }
  }*/
   
   

    
    GameCharacter(){
    global = new GlobalInfo(100,0,100);
    local = new LocalInfo(width/2,height/2,global.sprite.width,global.sprite.height,100,0,100);
    //comp.players.add(this);
    }
}