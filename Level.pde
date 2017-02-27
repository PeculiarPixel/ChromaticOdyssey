class Level{ //will extend this class into different levels, ex LevelOne,LevelTwo, etc
public ArrayList<Movie> cutscenes;
public ArrayList<PlayerCharacter> characters;
//public ArrayList<Item> items;
//public ArrayList<Menu> menus;
public ArrayList<Landscape> landscapes;

Level nextState(){  //Nathan - I edited the level class so it is a basis from which to extend specific levels.  Note there is now a Test_Level_0 extended from this class
  return null;
}

Level(){
  
}

/*Level(PlayerCharacter newt){
cutscenes =new ArrayList<Movie>();
characters =new ArrayList<PlayerCharacter>();
characters.add(newt);
//items =new ArrayList<Item>();
//menus =new ArrayList<Menu>();
//landscapes =new ArrayList<Landscape>();
//landscapes.add(new Landscape(300, 150, random(100,200), random(100,200))); // this needs to be deleted eventually so we can just extend the level to a new level
}*/
}