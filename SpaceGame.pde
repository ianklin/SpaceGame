HashMap<String,PImage> imageMap = new HashMap<String,PImage>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean upKey,downKey,leftKey,rightKey,spaceKey;
int points;
Spawner spawn;
void setup(){
  size(800,800);
  String filepath = sketchPath();
  File sprites = new File(filepath+"/images");
  String[] spriteKeys = sprites.list();
  for(int i = 0;i<spriteKeys.length;i++){
    PImage s = loadImage("images/"+spriteKeys[i]);
    imageMap.put(spriteKeys[i].substring(0,spriteKeys[i].length()-4),s);
  }
  Background b1 = new Background();
  b1.y = 100;
  Background b2 = new Background();
  b2.y = -700;
  new Player();
  spawn = new Spawner();
  points = 0;
}
void draw(){
  loopAllObjects();
  spawn.update();
  //resetKeys();
}

void loopAllObjects(){
  for(int i = 0;i<objects.size();i++){
    objects.get(i).parentUpdate();
  }
}

void resetKeys(){
  upKey = false;
  downKey = false;
  leftKey = false;
  rightKey = false;
  spaceKey = false;
}

void keyPressed(){
  if(keyCode == UP){
    upKey = true;
  }
  if(keyCode == DOWN){
    downKey = true;
  }
  if(keyCode == LEFT){
    leftKey = true;
  }
  if(keyCode == RIGHT){
    rightKey = true;
  }
  if(keyCode == 32){
    spaceKey = true;
  }
}

void keyReleased(){
  if(keyCode == UP){
    upKey = false;
  }
  if(keyCode == DOWN){
    downKey = false;
  }
  if(keyCode == LEFT){
    leftKey = false;
  }
  if(keyCode == RIGHT){
    rightKey = false;
  }
  if(keyCode == 32){
    spaceKey = false;
  }
}

public float distance(GameObject a, GameObject b){
  float distanceX;
  float distanceY;
  distanceX = a.x - b.x; 
  distanceY = a.y - b.y;
  return sqrt(distanceX*distanceX + distanceY*distanceY);
}
