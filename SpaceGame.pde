enum levels{
  MAIN,
  LEVEL1,
  LEVEL2,
  LEVEL3,
  LEVEL4
}

HashMap<String,PImage> imageMap = new HashMap<String,PImage>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean upKey,downKey,leftKey,rightKey,spaceKey;
int points;
Player player1;
Spawner spawn;
Spawner spawn2;
levels currentState;
void setup(){
  size(800,800);
  String filepath = sketchPath();
  File sprites = new File(filepath+"/images");
  String[] spriteKeys = sprites.list();
  for(int i = 0;i<spriteKeys.length;i++){
    if(spriteKeys[i] != "./DS_Store"){
      PImage s = loadImage("images/"+spriteKeys[i]);
      imageMap.put(spriteKeys[i].substring(0,spriteKeys[i].length()-4),s);
    }
  }
  Background b1 = new Background();
  b1.y = 100;
  Background b2 = new Background();
  b2.y = -700;
  player1 = new Player();
  
  spawn = new Spawner("enemy2");
  spawn2 = new Spawner("enemy1");
  //new Boss(player1);
  currentState = levels.LEVEL4;
  new Boss(player1);
  points = 0;
}
void draw(){
  loopAllObjects();
  
  //spawn.update();
  switch (currentState){
    case LEVEL1:
    //just enemy2 
      spawn.update();
      if(points >= 750){
        currentState = levels.LEVEL2;
      }
      break;
    case LEVEL2:
    //add enemy1
      spawn.update();
      spawn2.update();
      if(points >= 1250){
        currentState = levels.LEVEL3;
        spawn.min = 600;
        spawn.max = 1000;
        spawn2.min = 600;
        spawn2.max = 1000;
      }
      break;
    case LEVEL3:
    //less respawnTime in spawner
      spawn.update();
      spawn2.update();
      if(points >= 1900){
        currentState = levels.LEVEL4;
        new Boss(player1);
      }
      break;
    case LEVEL4:
    //last boss
      break;
    case MAIN:
      break;
  }
  //resetKeys();
  
  //if(points >= 1000){
  //  spawn.spawnerRunning = false;
  //  spawn.canSpawn=true;
    //spawn.boss = ;
  //}
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
