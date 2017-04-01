class Fog{
PImage fogImage;  // the image shown for each particle

int numCircles;  // the number of particles 

ArrayList<Position>position;  // a list of the positions of all the particles
float xpos ;                  // the position the particles are centered around
float ypos ;                  //
  
float[] seedX;// = new float[numCircles];  //an array of seeds corresponding to each particle, used for random movement
float[] seedY;// = new float[numCircles];





void run(){
  imageMode(CENTER);

  blendMode(SUBTRACT);
 
  for(int i=0;i<numCircles;i++){
    position.get(i).x = map(noise(seedX[i]),0,1,-2*width,2*width);
    position.get(i).y = map(noise(seedY[i]),0,1,-2*height,2*height);
  
    float distance = dist(newt.local.xPos,newt.local.yPos,xpos+position.get(i).x,ypos+position.get(i).y);
    tint(255,255,100,map(distance/3,0,255,0,distance*4)); //dist(0,0,width,height) //maybe tint color semi randomly to add purple haze
    image(fogImage, xpos+position.get(i).x, ypos+position.get(i).y);

    //ellipse(30,30,position.get(i).x, position.get(i).y);
    seedX[i] = seedX[i]+ 0.001;
    seedY[i] =seedY[i]+ 0.001;

  }
  blendMode(BLEND);
   tint(255,255);
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
  seedX= new float[numCircles];
  seedY= new float[numCircles];
  //create the number of particles specified
  for(int i=0;i<numCircles;i++){
    //pick a random seed so movement changes between runs
    seedX[i] = (random(0,width));
    seedY[i] = (random(0,height));
    //also random particle start position
    position.add(new Position(xpos,ypos));
  }

}
}