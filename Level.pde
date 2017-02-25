class Level{ //will extend this class into different levels, ex LevelOne,LevelTwo, etc
private ArrayList<Movie> cutscenes;
private ArrayList<PlayerCharacter> characters;
//private ArrayList<Item> items;
//private ArrayList<Menu> menus;
private ArrayList<Landscape> landscapes;


Level(PlayerCharacter newt){
cutscenes =new ArrayList<Movie>();
characters =new ArrayList<PlayerCharacter>();
characters.add(newt);
//items =new ArrayList<Item>();
//menus =new ArrayList<Menu>();
landscapes =new ArrayList<Landscape>();
landscapes.add(new Landscape(300, 150, random(100,200), random(100,200))); // this needs to be deleted eventually so we can just extend the level to a new level
}
}