class ImageMaker
{ 
  private final Color transparentWhite = new Color(0xFF, 0xFF, 0xFF, 127);
  
 public ImageMaker()
 {
   initializeGraphics();
 }
 
 public void initializeGraphics()
 {
   
 }

 // Button and image construction:
    
    public ArbitraryButton constructBaseButton(Point point, Font font, String string, Point strPt, ArbitraryFunction function)
    {
      Point sizePoint = new Point(512, 128);
      
      BufferedImage base = drawBaseRectImage(sizePoint, font, strPt, string);
      BufferedImage hover = drawHoverRectImage(sizePoint, font, strPt, string);
      
      return new ArbitraryButton(base, hover, point, 512, 128, function);
    }
    
    public ArbitraryButton constructColorButton(Color bColor, Point point, int diameter)
    {
      BufferedImage base = drawBaseCircImage(diameter, bColor);
      BufferedImage hover = drawHoverCircImage(diameter, bColor);
      
      return new ArbitraryButton(base, hover, point, diameter, diameter);
    }
      
    // Make width a parameter and this could be merged with constructBaseButton
    public ArbitraryButton constructItemButton(Point point, Font font, String string, Point strPt)
    {
      Point sizePt = new Point(256, 128);
      
      BufferedImage base = drawBaseRectImage(sizePt, font, strPt, string);
      BufferedImage hover = drawHoverRectImage(sizePt, font, strPt, string);
      
      return new ArbitraryButton(base, hover, point, 256, 128);
    }
  
    public BufferedImage constructSpriteFrameImage()
    {
      BufferedImage img = new BufferedImage(256, 384, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = img.createGraphics();
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );    
      
      //g2.setColor(Color.WHITE);
      //g2.fillRect(0, 0, 256, 384);
      
      //g2.setColor(Color.GRAY);
      //g2.drawRect(0, 0, 256, 384);
      
      return img;
    }
    
    public BufferedImage constructNameFrameImage()
    {
      BufferedImage img = new BufferedImage(256, 128, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = img.createGraphics();
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );  
      
      g2.setColor(transparentWhite);
      g2.fillRect(0, 0, 256, 128);
      
      g2.setColor(Color.GRAY);
      g2.drawRect(0, 0, 256, 128);
      
      return img;
    }
    
    public BufferedImage drawBaseRectImage(Point sizePt, Font font, Point stringPt, String string)
    {
      BufferedImage img = new BufferedImage(sizePt.x, sizePt.y, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = img.createGraphics();
      
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );  
      
      g2.setColor(transparentWhite);
      g2.fillRect(0, 0, img.getWidth(), img.getHeight());
      
      g2.setFont(font);
      g2.setColor(Color.RED);
      g2.drawString(string, stringPt.x, stringPt.y);
      
      g2.setColor(Color.GRAY);
      g2.drawRect(0, 0, img.getWidth(), img.getHeight());
      
      return img;
    }
    
    public BufferedImage drawHoverRectImage(Point sizePt, Font font, Point stringPt, String string)
    {
      BufferedImage img = new BufferedImage(sizePt.x, sizePt.y, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = img.createGraphics();
      
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );  
      
      g2.setColor(Color.RED);
      g2.fillRect(0, 0, img.getWidth(), img.getHeight());
      
      g2.setFont(font);
      g2.setColor(Color.WHITE);
      g2.drawString(string, stringPt.x, stringPt.y);
      
      g2.setColor(Color.GRAY);
      g2.drawRect(0, 0, img.getWidth(), img.getHeight());
      
      return img;
    }
    
    public BufferedImage drawBaseCircImage(int diameter, Color bColor)
    {
      BufferedImage img = new BufferedImage(diameter, diameter, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = img.createGraphics();
      
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );  
      
      // If you dont make the circle size slightly smaller than the size of the BufferedImage,
      // the edges of the shape could get cropped off.
      g2.setColor(bColor);
      g2.fillOval(0, 0, img.getWidth() - 1, img.getHeight() - 1);
      
      g2.setColor(Color.GRAY);
      g2.drawOval(0, 0, img.getWidth() - 1, img.getHeight() - 1);
      
      return img;
    }
    
    public BufferedImage drawHoverCircImage(int diameter, Color bColor)
    {
      BufferedImage img = drawBaseCircImage(diameter, bColor);
      Graphics2D g2 = img.createGraphics();
      
      g2.setRenderingHint( RenderingHints.KEY_ANTIALIASING,
          RenderingHints.VALUE_ANTIALIAS_ON );  
      
      g2.setColor(Color.BLACK);
      g2.fillOval(img.getWidth() / 4, img.getHeight() / 4, img.getWidth() / 2, img.getHeight() / 2);
      
      return img;
    }
    
    public BufferedImage drawTestSprite(Color colr)
    {
      BufferedImage img = new BufferedImage(256, 384, BufferedImage.TYPE_INT_ARGB);
      Graphics2D g2 = (Graphics2D) img.createGraphics();
      //g2.setColor(Color.WHITE);
      //g2.fillRect(0, 0, 256, 384);
          
      //g2.setColor(Color.GRAY);
      //g2.drawRect(0, 0, 256, 384);
      
      g2.setColor(colr);
      g2.fillRect(28, 92, 200, 200);
      return img;
    }
    
    
}