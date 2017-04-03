class Fog{
PImage fogImage;  // the image shown for each particle

int numCircles;  // the number of particles 

ArrayList<Position>position;  // a list of the positions of all the particles
float xpos ;                  // the position the particles are centered around
float ypos ;                  //
  
ArrayList<Float> seedX;// = new float[numCircles];  //an array of seeds corresponding to each particle, used for random movement
ArrayList<Float> seedY;// = new float[numCircles];





void run(float fade){
  imageMode(CENTER);

  blendMode(SUBTRACT);
 
  for(int i=0;i<numCircles;i++){
    position.get(i).x = map(noise(seedX.get(i)),0,1,-2*width,2*width);
    position.get(i).y = map(noise(seedY.get(i)),0,1,-2*height,2*height);
    if(fade ==-1){
    float distance = dist(newt.local.xPos,newt.local.yPos,xpos+position.get(i).x,ypos+position.get(i).y);
    tint(255,255,100,map(distance/3,0,255,0,distance*3)); //dist(0,0,width,height) //the multiplier of distance changed the size of halo
    }else{
     tint(255,255,100,fade);
    }
    image(fogImage, xpos+position.get(i).x, ypos+position.get(i).y);

    //ellipse(30,30,position.get(i).x, position.get(i).y);
    seedX.set(i,seedX.get(i)+ 0.001);
    seedY.set(i,seedY.get(i)+ 0.001);

  }
  blendMode(BLEND);
   tint(255,255);
}





void addCircles(int change){
  for(int i=0;i<change;i++){
    //pick a random seed so movement changes between runs
    seedX.add( (random(0,width)));
    seedY.add( (random(0,height)));
    //also random particle start position
    position.add(new Position(xpos,ypos));
  }
}

void removeCircles(int change){
  for(int i=0;i<change;i++){
    //pick a random seed so movement changes between runs
    if(!seedX.isEmpty()){
    seedX.remove(seedX.size()-1);
    seedY.remove(seedY.size()-1);
  }
    //also random particle start position
     if(!position.isEmpty()){
    position.remove(position.size()-1);
     }
  }
}




















Fog(float putX,float putY,int numberCircles){
  
  //initialize area center and number of particles
  xpos = putX;
  ypos = putY;
  numCircles = numberCircles;
  

  //intialize image to be used for particle
  fogImage = loadImage("FOG-blend2.png");
  //initialize the position array for particles and the seeds for the particles
  position  = new ArrayList<Position>();
  seedX= new ArrayList<Float>();
  seedY= new ArrayList<Float>();
  //create the number of particles specified
  for(int i=0;i<numCircles;i++){
    //pick a random seed so movement changes between runs
    seedX.add( (random(0,width)));
    seedY.add( (random(0,height)));
    //also random particle start position
    position.add(new Position(xpos,ypos));
  }

}
}