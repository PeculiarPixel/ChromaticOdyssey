class CombatColor
{
 private Color colr;
 private ArrayList<CombatMove> moves;
 private int[] modifiers;
 private int[] meterMods;
 private int[] activeMods;
 private int meterIndex;
 private int meter;
 private BufferedImage selectorImage;
 
 public CombatColor(Color colr, int[] modifiers, int meterIndex)
 {
   moves = new ArrayList<CombatMove>();
   this.colr = colr;
   this.modifiers = modifiers;
   this.meterIndex = meterIndex;
   //this.selectorImage = selectorImage;
   meter = 0;
 }
 
 public Color getColor()
 {
   return colr;
 }
 
 public BufferedImage getSelectorImage()
 {
   return selectorImage;
 }
 
 public int getMeterIndex()
 {
   return meterIndex;
 }
 
 public int[] getModifiers()
 {
   return modifiers;
 }
 
 public int[] getMeterMods()
 {
   return meterMods;
 }
 
 public void setMoves(ArrayList<CombatMove> moves)
 {
   this.moves = moves;
 }
 
 public void addMove(CombatMove move)
 {
   moves.add(move);
 }
 
 public ArrayList<CombatMove> getMoves()
 {
   return moves;
 }
 
 public int getMeter()
 {
   return meter;
 }
 
 public void buildMeter()
 {
   meter++;
   if (meter > 5) meter = 5;
 }
 
 public CombatMove getRandomMove()
 {
   /*
   Random rand = new Random();
   return moves.get(rand.nextInt(moves.size()));
   */
   return moves.get(int(random(moves.size())));
 }
 
 public ArrayList<ArbitraryButton> getMeteredButtons()
 {
   ArrayList<ArbitraryButton> buttons = new ArrayList<ArbitraryButton>();
   
   buttons.add(moves.get(0).getButton());
   
   if (meter >= 2)
   {
     buttons.add(moves.get(1).getButton());
   }
   
   if (meter == 5)
   {
     buttons.add(moves.get(2).getButton());
   }
   
   return buttons;
 }
 
 public ArrayList<ArbitraryButton> getButtons()
 {
   ArrayList<ArbitraryButton> buttons = new ArrayList<ArbitraryButton>();
   
   for(CombatMove move : moves)
     buttons.add(move.getButton());
   
   return buttons;
 }
 
 public void setTarget(Combatant target)
 {
   for(CombatMove move : moves)
     move.setTarget(target);
 }
 
 
}