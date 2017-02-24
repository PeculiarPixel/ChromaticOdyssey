class ComputationEngine{ //will extend this class into different landscapes if needed
ArrayList<Hitbox> hitboxes;
ArrayList<PlayerCharacter> players;
void run(){
  moveCharacter(5.0);
}


void computeIntersection(Hitbox hBox1, Hitbox hBox2, float xChange, float yChange){
  
  if((hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2) &&
    (hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 + xChange &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2 + xChange))
    {
      hBox2.isHitX=true;
      hBox1.isHitX=true;
    }
  else{
    hBox2.isHitX=false;
    hBox2.isHitX=false;
  }

  if((hBox1.xPos + hBox1.hitWidth/2 >= hBox2.xPos - hBox2.hitWidth/2 &&
    hBox1.xPos - hBox1.hitWidth/2 <= hBox2.xPos + hBox2.hitWidth/2) &&
    (hBox1.yPos + hBox1.hitHeight/2 >= hBox2.yPos - hBox2.hitHeight/2 + yChange &&
    hBox1.yPos - hBox1.hitHeight/2 <= hBox2.yPos + hBox2.hitHeight/2 + yChange))
      {
      hBox2.isHitY=true;
      hBox1.isHitY=true;
    }
  else{
    hBox2.isHitY=false;
    hBox1.isHitY=false;
  }

}

 void moveCheck(float xChange, float yChange){ //this assumes that the player's hitbox is initialized and added to the computation engine first, player is hitboxes[0]
    for(int i = 0; i < hitboxes.size(); i++){
      computeIntersection(hitboxes.get(i), players.get(0).local.hitbox,xChange,yChange);
      if(players.get(0).local.hitbox.isHitX)
        xChange = 0;
      if(players.get(0).local.hitbox.isHitY)
        yChange = 0;
    }

    players.get(0).local.xPos += xChange;
    players.get(0).local.yPos += yChange;

    players.get(0).local.hitbox.xPos= players.get(0).local.xPos;
    players.get(0).local.hitbox.yPos= players.get(0).local.yPos;
  } 


  void moveCharacter(float speed){
    
    if(players.get(0).local.moveUp){
      moveCheck(0.0,-speed);
    }
    if(players.get(0).local.moveDown){
      moveCheck(0.0,speed);
    }
    if(players.get(0).local.moveLeft){
      moveCheck(-speed,0.0);
    }
    if(players.get(0).local.moveRight){
      moveCheck(speed,0.0);
    }
    

  }




ComputationEngine(){
hitboxes = new ArrayList<Hitbox>();
players = new ArrayList<PlayerCharacter>();
}
}