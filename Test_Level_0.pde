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
landscapes.add(new Landscape(300, 150,10,10,"Landscape"));
landscapes.add(new Landscape(310, 160,10,10,"Landscape"));
landscapes.add(new Landscape(320, 170,10,10,"Landscape"));
landscapes.add(new Landscape(330, 180,10,10,"Landscape"));
landscapes.add(new Landscape(340, 190,10,10,"Landscape"));// this needs to be deleted eventually so we can just extend the level to a new level
landscapes.add(new Landscape(600, 300, 100, 100,"EventBox"));

landscapes.add(new Landscape(200, 200, 300, 100,"DamageBox"));

try{
  conversations = fileUtils.getLevelConversations("levelScripts/level0");
 } catch (DirectoryNotFoundException dnfe) {
      println(dnfe.getLocalizedMessage());
  } 
}

}