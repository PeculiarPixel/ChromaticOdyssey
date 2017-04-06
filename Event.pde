abstract class Event {
  
  EventTypeEnum type;
  
  public Event(EventTypeEnum e) {
    this.type = e;
  }
 
   abstract void send();
}

enum EventTypeEnum {
  DISPLAY,
  STATE,
  COMPUTATION,
  CLEAR;
}