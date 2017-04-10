class Fog {
  
  PImage fogImage;                // The image shown for each particle
  int numCircles;                 // The number of particles 
  ArrayList<Position> position;   // List of the positions of all the particles
  
  // The position the particles are centered around
  float xpos;                  
  float ypos;
    
  // An array of seeds corresponding to each particle, used for random movement
  private ArrayList<Float> seedX;
  private ArrayList<Float> seedY;
  
  private final float HALO_SIZE;                // How large the float particle 'halos' are, higher means larger particles
  private final float DISPERSION_DISTANCE_X;    // The X range of spread for the particles, from the center point outwards
  private final float DISPERSION_DISTANCE_Y;    // The Y range of spread for the particles, from the center point outwards  
  private final float FADE_FACTOR;

  // Advanced Constructor
  public Fog(float putX, float putY, int numberCircles, 
             float haloSize, float despersionX, float despersionY, float fadeFactor) {
  
      // Initialize the area center and # of particles
    this.xpos = putX;
    this.ypos = putY;
    this.numCircles = numberCircles;
    this.HALO_SIZE = haloSize;
    this.DISPERSION_DISTANCE_X = despersionX;
    this.DISPERSION_DISTANCE_Y = despersionY;
    this.FADE_FACTOR = fadeFactor;

    // Initialize fog image
    fogImage = loadImage("FOG-blend2.png");
    
    // Initialize the position array for particles and the seeds for the particles
    this.position  = new ArrayList<Position>();
    this.seedX = new ArrayList<Float>();
    this.seedY = new ArrayList<Float>();
  
    setupSeeds();

  }

  // Setup fog 'seeds'
  private void setupSeeds() {
    
    // Create the number of particles specified
    for(int i=0; i < numCircles; i++) {
      
      // Pick a random seed so movement changes between runs
      seedX.add( (random(0, width)));
      seedY.add( (random(0, height)));
      
      // Also random particle start position
      position.add(new Position(xpos,ypos));
      
    }
    
  }

  // Run the fog animation
  public void run(float fade) {
    imageMode(CENTER);
    blendMode(SUBTRACT);
   
    for(int i = 0; i < numCircles; i++) {
      
      position.get(i).x = map( noise( seedX.get(i) ), 0, 1, -2 * DISPERSION_DISTANCE_X, 2 * DISPERSION_DISTANCE_X);
      position.get(i).y = map( noise( seedY.get(i) ), 0, 1, -2 * DISPERSION_DISTANCE_Y, 2 * DISPERSION_DISTANCE_Y);
      
      if (fade ==-1) {
        
        // Calculate distance to newt
        float distance = dist(newt.local.xPos, newt.local.yPos, xpos + position.get(i).x, ypos + position.get(i).y);
        
        // The multiplier of distance changed the size of halo
        tint(255,255,100, map(distance/3 / FADE_FACTOR, 0, 255, 0, distance* HALO_SIZE));
        
      } else {
        
        // Apply base fade tint
       tint(255,255,100,fade);
         
      }
      
      image(fogImage, xpos+position.get(i).x, ypos+position.get(i).y);
  
      // Set seed values
      seedX.set(i, seedX.get(i) + 0.001);
      seedY.set(i, seedY.get(i) + 0.001);
  
    }
   
     // Apply base tint
     blendMode(BLEND);
     tint(255, 255);
   
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

}