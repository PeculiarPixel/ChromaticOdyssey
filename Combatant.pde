class Combatant
{
  private BufferedImage sprite;
  private GameCharacterName name;
  private CombatColor activeColor;
  private int maxHP;
  private int curHP;
  private int[] baseStats;
  private int[] stats;
  private int[] meters;
  private int[][] meterMods;
  
  private int[] statusCounters;
  
  private SpriteAnimation currentAnimation;
  private HashMap<String, SpriteAnimation> animations; 
  
  private boolean isActing;
  private boolean isAttacking;
  
  private CustomDisplay spriteFrame;
  private CustomDisplay nameFrame;
  
  private static final int DAMAGE = 0;
  private static final int DEFENSE = 1;
  private static final int SPEED = 2;

  private static final int RED = 0;
  private static final int BLUE = 1;
  private static final int YELLOW = 2;
  
  private static final int LETHARGY = 0;
  private static final int MANIA = 1;
  
  public Combatant(GameCharacterName name, BufferedImage sprite, CombatColor combatColor, int[] baseStats, int[][] meterMods)
  {
    this.baseStats = baseStats;
    this.name = name;
    maxHP = 200;
    curHP = maxHP;

    this.animations = spriteLibrary.getCharacterAnimations(name);
    this.currentAnimation = animations.get("IDLE_COMBAT");
    
    meters = new int[3];
    meters[RED] = 0;
    meters[BLUE] = 0;
    meters[YELLOW] = 0;
    
    this.activeColor = combatColor;
    
    stats = new int[3];
    stats[DAMAGE] = baseStats[DAMAGE];
    stats[DEFENSE] = baseStats[DEFENSE];
    stats[SPEED] = baseStats[SPEED];
    
    this.meterMods = meterMods;
    
    this.sprite = sprite;

    this.isActing = false;
  }
  
  public int getDamage()
  {
    return stats[DAMAGE];
  }
  
  public void setStatusCounter(int index, int counter)
  {
    statusCounters[index] = counter;
  }
  
  public int getStatusCounter(int index)
  {
    return statusCounters[index];
  }
  
  public void decrementStatusCounter(int index)
  {
    statusCounters[index]--;
  }
  
  public void buildActiveMeter(int magnitude)
  {
    meters[activeColor.getMeterIndex()] += magnitude;
  }
  
  public void buildMeter(int meterIndex, int magnitude)
  {
    meters[meterIndex] += magnitude;
  }
  
  public void setSpriteFrame(CustomDisplay spriteFrame)
  {
    this.spriteFrame = spriteFrame;
  }
  
  public void setNameFrame(CustomDisplay nameFrame)
  {
    this.nameFrame = nameFrame;
  }
  
  public void updateDisplays()
  {
    nameFrame.update();
    spriteFrame.update();
  }
  
  public void changeColor(CombatColor nextColor)
  {
    //revertStatMods();
    println("COLOR CHANGED");
    println();
    println();
    activeColor = nextColor;
    //applyStatMods();
    recalculateStats();
    updateDisplays();
  }
  
  public void recalculateStats()
  {
    //println("Recalculating stats");
    for(int i = 0; i < stats.length; i++)
    {
      stats[i] = baseStats[i];
      //println("stats[" + i + "] = " + stats[i] + " base[" + i + "] = " + baseStats[i]);
      if (stats[i] < 0) stats[i] = 0;
    }
     applyStatMods();
     applyMeterMods();
     
     for(int i = 0; i < stats.length; i++)
     {
       if(stats[i] < 0) 
         stats[i] = 0;
     }
  }
  
  private void applyMeterMods()
  {
    for(int i = 0; i < meters.length; i++) // For each meter,
    {
      for(int j = 0; j < stats.length; j++) // For each stat affected by that meter,
      {
        for(int k = 0; k < meters[i]; k++) // For each point on the meter,
        {
          //println("stats[" + i + "] premetermod = " + stats[i]);
          
          if (j == i) 
            stats[i] += meterMods[i][j];
          else if (meters[j] < meters[i])
            stats[j] += meterMods[i][j]; 
          
          
          //println("stats[" + i + "] postmetermod = " + stats[i]);
        }
      }
    }
  }
  
  private void applyStatMods()
  {
    println("applying stat mods");
    int[] modifiers = activeColor.getModifiers();
    for(int i = 0; i < modifiers.length; i++)
    {
      //println("initial stats[" + i + "] = " + stats[i] + " mod[i] = " + modifiers[i]); 
      stats[i] += modifiers[i];
      //println("modified stats[" + i + "] = " + stats[i]);
      
    }  
  }
  
  private void revertStatMods()
  {
    int[] modifiers = activeColor.getModifiers();
    for(int i = 0; i < modifiers.length; i++)
      stats[i] -= modifiers[i];
  }
  
  public String getHPString()
  {
    return curHP + "/" + maxHP;
  }
  
  public CombatColor getActiveColor()
  {
    return activeColor;
  }
  
  public void setStats(int[] stats)
  {
    this.stats = stats;
  }
  
  public boolean isDead()
  {
    return (curHP <= 0);
  }
  
  public int getSpeed()
  {
    return stats[SPEED];
  }
  
  public String getName()
  {
    return name.toString();
  }
  
  public int[] getStats()
  {
    return stats;
  }
  
  public int getMeter(int index)
  {
    return meters[index];
  }
  
  public void takeDamage(int dmg)
  {
    //System.out.println("curHP = " + curHP);
    //System.out.println("Def = " + stats[ARMOR]);
    
    float defFactor = (float) (100 - stats[DEFENSE])/100;
    
    //System.out.println("Armor factor = " + defFactor);
    
    int reducedDmg = Math.round(defFactor * dmg);
    
    //System.out.println("Final Damage = " + reducedDmg);
    
    curHP -= reducedDmg;
  }

  public void heal(int healing)
  {
    curHP += healing;
    
    if (curHP > maxHP) 
      curHP = maxHP;
  }
  
  public void setSprite(BufferedImage sprite)
  {
    this.sprite = sprite;
  }

  public BufferedImage getSprite()
  {
    return sprite;
  }
  
  public BufferedImage getCurrentSprite()
  {
    if(curHP <= 100)
    {
      currentAnimation = animations.get("HURT");
    }
    BufferedImage spriteImage = (BufferedImage) currentAnimation.getCurrentImage().getNative();
    currentAnimation.update();
    return spriteImage;
  }
  
  public CombatMove getRandomMove()
  {
    return activeColor.getRandomMove();
  }
  
  public void boostActiveMeter()
  {
    boostMeter(activeColor.getMeterIndex());
    activeColor.buildMeter();
    recalculateStats();
    // change buttons
  }
  
  public void boostMeter(int index)
  {
    if(index >= 0 && index < 3)
    {
      meters[index]++;
      if (meters[index] > 5) meters[index] = 5;
    }
  }
}