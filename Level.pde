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
landscapes.add(new Landscape(300, 150, 100, 50)); // this needs to be standardized and cleaned up so its easier to make new instances of things
}
}