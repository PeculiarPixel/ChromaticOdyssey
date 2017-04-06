
GameCharacter newt;               // Main character, Newt
GameCharacter kit;

boolean hitBoxMode = false;       // Default hitbox mode setting
boolean initValues;
boolean kitKeyPress;

Movie introScreen;

ArrayList<MoveDirection> kitMoveSet;
ArrayList<MoveDirection> kitMoveRelease;

// Screen size & FPS rate
final static int SCREEN_WIDTH = 1024;        
final static int SCREEN_HEIGHT = 768;
final static int FRAMES_PER_SECOND_RATE = 60;
final static int BACKGROUND_COLOR = 0;
final static int IDLE_ANIMATION_RATE = 30;              // Animation rate
final static int WALK_ANIMATION_RATE = 10;              // Animation rate

// Animation indicies   

World world;
ComputationEngine comp;                 // Computation Engine
StateEngine state;                      // State Engine
DisplayEngine display;                  // Display Engine
EventDispatcher dispatcher;             // Event Dispatcher
SpriteAnimationLibrary spriteLibrary;   // Sprite Animation Library
FileUtils fileUtils;                    // File I/O Utilities
GameCamera camera;                      // Game camera view
DrawUtilities drawUtils;                // Draw utilities

//movement variables
float px;
float py;
float saveX;
float saveY;