abstract class Trigger extends Area 
{  
  protected boolean isActive = false;

  // Default Constructor
  Trigger(float x, float y, float w, float h, AreaTypeEnum designation) {
    super(x, y, w, h, designation);
  }
  
  public void initialize() {
    comp.addTrigger(this);
  }
  
  // Trigger function
  abstract void trigger();
  
  // Check if triggered
  public boolean hasActivated() {
    return this.isActive;
  }
  
  protected void triggerEvents() {
    this.clearHit();
  }
  
}