class Test_Level_0 extends Level{ //will extend this class into different levels, ex LevelOne,LevelTwo, etc

Level nextState(){
  comp.clear();
  Test_Level_1 next = new Test_Level_1(newt);
  return next;
}



Test_Level_0(GameCharacter newt){
cutscenes =new ArrayList<Movie>();
characters =new ArrayList<GameCharacter>();
conversations = new ArrayList<Dialog>();
characters.add(newt);
//items =new ArrayList<Item>();
//menus =new ArrayList<Menu>();

//next = new Test_Level_1(newt);
landscapes =new ArrayList<Landscape>();

backgroundImage = loadImage("CastleWalkup.png");
foregroundImage = loadImage("CastleWalkupTopLayer.png");
hitboxImage = loadImage("hitboxLayer.png");
//backgroundImage.resize(backgroundImage.width*4,backgroundImage.height*4);
//foregroundImage.resize(foregroundImage.width*4,foregroundImage.height*4);

//landscapes.add(new Landscape(100, 2450,800,40,"Landscape",-1));
//landscapes.add(new Landscape(540, 2430,80,40,"Landscape",-1));
//landscapes.add(new Landscape(320, 170,10,10,"Landscape",-1));
//landscapes.add(new Landscape(330, 180,10,10,"Landscape",-1));
//landscapes.add(new Landscape(340, 190,10,10,"Landscape",-1));
//landscapes.add(new Landscape(600, 300, 100, 100,"EventBox",-1));

//landscapes.add(new Landscape(200, 200, 300, 100,"DamageBox",-1));

try{
  conversations = fileUtils.getLevelConversations("levelScripts/level0");
 } catch (DirectoryNotFoundException dnfe) {
      println(dnfe.getLocalizedMessage());
  } 
}

}