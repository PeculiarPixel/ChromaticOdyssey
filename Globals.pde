
GameCharacter newt;               // Main character, Newt
boolean hitBoxMode = false;       // Default hitbox mode setting

// Screen size & FPS rate
final static int SCREEN_WIDTH = 1024;        
final static int SCREEN_HEIGHT = 768;
final static int FRAMES_PER_SECOND_RATE = 60;
final static int BACKGROUND_COLOR = 0;
final static int IDLE_ANIMATION_RATE = 30;              // Animation rate
final static int WALK_ANIMATION_RATE = 10;              // Animation rate

// Animation indicies

// Walk Directions
final static int IDLE_UP_ANIMATION_INDEX = 0;            
final static int IDLE_DOWN_ANIMATION_INDEX = 1;          
final static int IDLE_LEFT_ANIMATION_INDEX = 2;          
final static int IDLE_RIGHT_ANIMATION_INDEX = 3;         

final static int WALK_UP_ANIMATION_INDEX = 4;            
final static int WALK_DOWN_ANIMATION_INDEX = 5;          
final static int WALK_LEFT_ANIMATION_INDEX = 6;          
final static int WALK_RIGHT_ANIMATION_INDEX = 7;         

ComputationEngine comp;                 // Computation Engine
StateEngine state;                      // State Engine
DisplayEngine display;                  // Display Engine
EventDispatcher dispatcher;             // Event Dispatcher
SpriteAnimationLibrary spriteLibrary;   // Sprite Animation Library
FileUtils fileUtils;                    // File I/O Utilities

Test_Level_0 beginning;                 // Test Level 0

//movement variables
  float px;
  float py;
  float saveX;
  float saveY;
  
//globals for tracking
boolean dialog;                           //is dialog window up
String displayText;                       //the text currently being shown in the dialog window
int saveSpot ;                            //index of the current string animation