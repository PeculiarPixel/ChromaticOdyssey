class Test_Level_0 extends Level{ //will extend this class into different levels, ex LevelOne,LevelTwo, etc


Level nextState(){
  comp.clear();
  Test_Level_1 next = new Test_Level_1(newt);
  return next;
}



Test_Level_0(GameCharacter newt){
cutscenes =new ArrayList<Movie>();
characters =new ArrayList<GameCharacter>();
characters.add(newt);
//items =new ArrayList<Item>();
//menus =new ArrayList<Menu>();

//next = new Test_Level_1(newt);
landscapes =new ArrayList<Landscape>();
landscapes.add(new Landscape(300, 150,100,100,"Landscape")); // this needs to be deleted eventually so we can just extend the level to a new level
landscapes.add(new Landscape(600, 300, 100, 100,"EventBox"));
}

}