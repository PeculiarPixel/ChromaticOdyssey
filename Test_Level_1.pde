class Test_Level_1 extends Level{ //will extend this class into different levels, ex LevelOne,LevelTwo, etc



Level nextState(){
  comp.clear();
  Test_Level_0 next = new Test_Level_0(newt);
  return next;
}

Test_Level_1(GameCharacter newt){
cutscenes =new ArrayList<Movie>();
characters =new ArrayList<GameCharacter>();
conversations = new ArrayList<Dialog>();
characters.add(newt);
//items =new ArrayList<Item>();
//menus =new ArrayList<Menu>();
backgroundImage = loadImage("CastleWalkup.png");
foregroundImage = loadImage("CastleWalkupTopLayer.png");
//next = new Test_Level_0(newt);
landscapes =new ArrayList<Landscape>();
landscapes.add(new Landscape(350, 350,100,100,"Landscape",-1)); 
landscapes.add(new Landscape(120, 120, 100, 100,"EventBox",-1));

landscapes.add(new Landscape(300, 120, 100, 100,"DialogBox",0));
landscapes.add(new Landscape(700, 120, 100, 100,"DialogBox",1));



try{
  conversations= fileUtils.getLevelConversations("levelScripts/level1");
 } catch (DirectoryNotFoundException dnfe) {
      println(dnfe.getLocalizedMessage());
  } 
}

}