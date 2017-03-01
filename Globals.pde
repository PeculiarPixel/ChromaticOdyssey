
GameCharacter newt;               // Main character, Newt
boolean hitBoxMode = false;       // Default hitbox mode setting

// Screen size & FPS rate
int SCREEN_WIDTH = 1024;        
int SCREEN_HEIGHT = 768;
final int FRAMES_PER_SECOND_RATE = 60;
final int BACKGROUND_COLOR = 0;

ComputationEngine comp;           // Computation Engine
StateEngine state;                // State Engine
DisplayEngine display;            // Display Engine
EventDispatcher dispatcher;       // Event Dispatcher

Test_Level_0 beginning;           // Test Level 0

//movement variables
  float px;
  float py;
  float saveX;
  float saveY;