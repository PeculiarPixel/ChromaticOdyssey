class BackgroundInterpolator
{
  private static final int WIDTH = 1024;
  private static final int HEIGHT = 768;
  
  private BufferedImage image;
  
  public BackgroundInterpolator()
  {
    image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_ARGB);
    altImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_ARGB);
    
    // The corner pixels of the image are initialized:
    image.setRGB(0, 0, 0xFF0000FF);
    image.setRGB(WIDTH - 1, 0, 0xFFFFFF00);
    image.setRGB(0, HEIGHT - 1, 0xFF00FF00);
    image.setRGB(WIDTH - 1, HEIGHT - 1, 0xFFFF0000);
        
    // The first and last columns are interpolated:
    image = interpolateCol(image, HEIGHT - 1, 0);
    image = interpolateCol(image, HEIGHT - 1, WIDTH - 1);
     
    // Commented out here is an alternate method that generates the first and last rows, then each column.
    //myImage = interpolateRow(myImage, imageSize, 0);
    //myImage = interpolateRow(myImage, imageSize, imageSize);
        
    for (int i = 0; i <= HEIGHT - 1; i++)
    {
      // The intermediate pixels of each row are interpolated:
      image = interpolateRow(image, WIDTH - 1, i);
      
      // Alternate method:
      //myImage = interpolateCol(myImage, imageSize, i);
    }
    
    altImage.setRGB(0, 0, 0xFF00FF00);
    altImage.setRGB(WIDTH - 1, 0, 0xFFFF0000);
    altImage.setRGB(0, HEIGHT - 1, 0xFF0000FF);
    altImage.setRGB(WIDTH - 1, HEIGHT - 1, 0xFFFFFF00);
    
    altImage = interpolateCol(altImage, HEIGHT - 1, 0);
    altImage = interpolateCol(altImage, HEIGHT - 1, WIDTH - 1);
    
    for (int i = 0; i < HEIGHT; i++)
    {
      altImage = interpolateRow(altImage, WIDTH - 1, i); 
    }
  }
  
  
  // bound() - converts a float to an integer, then bounds that integer within a range of 0-255.
  private int bound(float val)
  {
    int value = Math.round(val);
    
    if (value < 0) return 0;
    
    if (value > 255) return 255;
    
    return value;
  }
  
  // interpolateCol() - interpolates a column from top to bottom.
  private BufferedImage interpolateCol(BufferedImage myImage, int max, int xCoord)
  {
    // The first and last intARGBs are extracted from the image:
    int initRGB = myImage.getRGB(xCoord, 0);
    int endRGB = myImage.getRGB(xCoord, max);
    
    // The color channels are parsed from the initial and terminal intARGBs:
    int initR = parseR(initRGB);
    int initG = parseG(initRGB);
    int initB = parseB(initRGB);
    
    int endR = parseR(endRGB);
    int endG = parseG(endRGB);
    int endB = parseB(endRGB);
    
    // Delta values are then calculated for each color channel:
    float myR = initR;
    float myG = initG;
    float myB = initB;
    
    float deltaR = ( (float) endR - initR) / max;
    float deltaG = ( (float) endG - initG) / max;
    float deltaB = ( (float) endB - initB) / max;
    
    for(int y = 1; y < max; y++)
    {
      // Current color values are incremented by their respective deltas:
      myR += deltaR;
      myG += deltaG;
      myB += deltaB;
      
      // A new intARGB value is synthesized from the new color values:
      int newColor = combineRGB(bound(myR), bound(myG), bound(myB));
      
      myImage.setRGB(xCoord, y, newColor);
      
    }
    
    return myImage;
  }
  
  private BufferedImage interpolateRow(BufferedImage myImage, int max, int yCoord)
  {
    // The first and last intARGBs are extracted from the image:
    int initRGB = myImage.getRGB(0, yCoord);
    int endRGB = myImage.getRGB(max, yCoord);
    
    // The color channels are parsed from the initial and terminal intARGBs:
    int initR = parseR(initRGB);
    int initG = parseG(initRGB);
    int initB = parseB(initRGB);
    
    int endR = parseR(endRGB);
    int endG = parseG(endRGB);
    int endB = parseB(endRGB);
    
    // Delta values are then calculated for each color channel:
    float myR = initR;
    float myG = initG;
    float myB = initB;
    
    float deltaR = ( (float) endR - initR) / max;
    float deltaG = ( (float) endG - initG) / max;
    float deltaB = ( (float) endB - initB) / max;
    
    for(int x = 1; x < max; x++)
    {
      // Current color values are incremented by their respective deltas:
      myR += deltaR;
      myG += deltaG;
      myB += deltaB;
      
      // A new intARGB value is synthesized from the new color values:
      int newColor = combineRGB(bound(myR), bound(myG), bound(myB));
      
      myImage.setRGB(x, yCoord, newColor);
      
    }
    
    return myImage;
  }
  
  // parseX() - converts an intARGB to just an X component integer.
  
  private int parseR(int myARGB)
  {
    int myR = (myARGB >>> 16) & 0x000000FF;
    return bound(myR);
  }
  
  private int parseG(int myARGB)
  {
    int myG = (myARGB >>> 8) & 0x000000FF;
    return bound(myG);
  }
  
  private int parseB(int myARGB)
  {
    int myB = (myARGB & 0x000000FF);
    return bound(myB);
  }
  
  // combineRGB synthesizes an intARGB value from three color channels.
  
  private int combineRGB (int myR, int myG, int myB)
  {
    return 0xFF000000 ^ (myR << 16) ^ (myG << 8) ^ myB;
  }
  
  public BufferedImage getImage()
  {
    return image;
  }
  
  public BufferedImage getAltImage()
  {
    return altImage;
  }
}
