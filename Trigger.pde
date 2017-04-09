abstract class Trigger extends Area 
{  
  protected boolean isActive = false;

  // Default Constructor
  Trigger(float x, float y, float w, float h, AreaTypeEnum designation) {
    super(x, y, w, h, designation);
  }
  
  public void initialize() {
    this.clearHit();
    comp.addTrigger(this);
  }
  
  // Trigger function
  abstract void trigger();
  
  // Check if triggered
  public boolean hasActivated() {
    return this.isActive;
  }
  
  // Activate the trigger
  protected void activate() {
    this.isActive = true;
  }
  
  // Deactivate and rearm the trigger
  protected void deactivate() {
    this.isActive = false;
  }
  
  protected void triggerEvents() {
    this.clearHit();
    this.activate();
  }
  
}