class CombatMove
{
 private Combatant user;
 private Combatant target;
 private float dmgMultiplier;
 private int meterBoost;
 private ArbitraryButton button;
 private ArrayList<ArbitraryFunction> effects;
 
 private BufferedImage[] explosionSprites;
 
 public CombatMove(float dmgMultiplier, int meterBoost, BufferedImage[] explosionSprites)
 {
   this(dmgMultiplier, meterBoost);
   this.explosionSprites = explosionSprites;
 }
 
 public CombatMove(float dmgMultiplier, int meterBoost)
 {
   this.dmgMultiplier = dmgMultiplier;
   this.meterBoost = meterBoost;
   effects = new ArrayList<ArbitraryFunction>();
 }
 
 public CombatMove(float dmgMultiplier)
 {
   this(dmgMultiplier, 0);
 }
 
 public void setButton(ArbitraryButton button)
 {
   this.button = button;
 }
 
 public ArbitraryButton getButton()
 {
   return button;
 }
 
 public Combatant getUser()
 {
   return user;
 }
 
 public void setUser(Combatant user)
 {
   this.user = user;
 }
 
 public Combatant getTarget()
 {
   return target;
 }
 
 public void setTarget(Combatant target)
 {
   this.target = target;
 }
 
 public void addEffect(ArbitraryFunction function)
 {
   effects.add(function);
 }
 
 public void setEffects(ArrayList<ArbitraryFunction> effects)
 {
   this.effects = effects;
 }
 
 public void attack()
 {
   System.out.println("Attack Detected");
   System.out.println("takeDmg input: " + (int) dmgMultiplier * user.getDamage());
   target.takeDamage((int) dmgMultiplier * user.getDamage());
   
   for(ArbitraryFunction effect : effects)
     effect.execute();
     
   for(int i = 0; i < meterBoost; i++)
     user.boostActiveMeter();
     
   user.updateDisplays();
   target.updateDisplays();
 }
 
 public void execute()
 {
   attack();
 }
}

class CombatItem extends CombatMove
{
  private int count;
  
  public CombatItem(int initialCount, int meterBoost, Combatant target)
  {
    super(0, meterBoost);
    super.setTarget(target);
    this.count = initialCount;
  }
  
  public void execute()
  {
    useItem();
    super.target.updateDisplays();
  }
  
  public void useItem()
  {
    if (count > 0)
    {
       count--;
    }
    else
    {
      
    }
  }
  
  public void healTarget(int healing)
  {
    super.target.heal(healing);
  }
  
  public void boostTargetMeter(int boost)
  {
    for(int i = 0; i < boost; i++)
      super.target.boostActiveMeter();
  }
  
  public void boostTargetMeter(int boost, int index)
  {
    for(int i = 0; i < boost; i++)
      super.target.boostMeter(index);
  }
  
  public int getCount()
  {
    return count;
  }
}

class HealingPotion extends CombatItem
{
  int healing;
  
  public HealingPotion(int initialCount, int healing, Combatant target)
  {
    super(initialCount, 0, target);
    this.healing = healing;
  }
  
  public void useItem()
  {
    if(super.count > 0)
    {
      super.healTarget(healing);
      super.count--;
    }
    else
    {
      
    }
  }
}

class MeterBooster extends CombatItem
{
  int boost;
  
  public MeterBooster(int initialCount, int boost, Combatant user)
  {
    super(initialCount, 0, user);
    this.boost = boost;
  }
  
  public void useItem()
  {
    if (super.count > 0)
    {
      super.boostTargetMeter(boost);
      super.count--;
    }
    else
    {
      
    }
  }
}