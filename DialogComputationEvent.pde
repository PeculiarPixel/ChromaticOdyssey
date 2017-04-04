class DialogComputationEvent extends ComputationEvent {
  
  private int conversation_index;

  // Constructor
  public DialogComputationEvent(int index) {
    super();
    this.conversation_index = index;
  }
  
  // Set the conversation index
  public void send() {
    comp.setConversationIndex(this.conversation_index);
    dialog = true;
  }
  
}