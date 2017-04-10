
GameCharacter newt;               // Main character, Newt
GameCharacter kit;
GameCharacter mythra;
GameCharacter pragma;

boolean hitBoxMode = false;       // Default hitbox mode setting
boolean initValues;


IntList startTime;
IntList stopTime;

int kitFollowDelay;
boolean runIntroStory = false;

Movie introScreen;
Movie introStory;
Movie GAME_OVER;
Movie OUTRO;
Movie MYTHRA_DEFEATED;
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
SoundLibrary sounds;                    // Sound Library
FileUtils fileUtils;                    // File I/O Utilities
GameCamera camera;                      // Game camera view
DrawUtilities drawUtils;                // Draw utilities
Minim minim;

// Combat globals

int[] inventory;

FightManager fightManager;
ImageMaker imageMaker;
boolean inCombat;
boolean lockMouseInput;

BufferedImage blackFireball;
BufferedImage redSelector;
BufferedImage blueSelector;
BufferedImage yellowSelector;