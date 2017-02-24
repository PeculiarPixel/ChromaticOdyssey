class Landscape{ //will extend this class into different landscapes if needed
ArrayList<Hitbox> hitboxes;
//ArrayList<Sprite> sprites; // possibly sprite_Animations


Landscape(Hitbox hitbox){
hitboxes =new ArrayList<Hitbox>();
//sprites =new ArrayList<Sprite>();
hitboxes.add(hitbox);
}
}