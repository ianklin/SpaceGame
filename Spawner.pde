class Spawner{
  boolean canSpawn;
  int timePassed;
  float respawnTime;
  boolean boss;
  boolean spawnerRunning;
  String spawnEntity;
  int min, max;
  public Spawner(String spawnEntity){
    boss = false;
    spawnerRunning = true;
    canSpawn=true;
    timePassed=0;
    min = 1000;
    max = 1300;
    respawnTime=random(min,max);
    this.spawnEntity = spawnEntity;
  }
  public void update(){
    if(spawnerRunning){
      timer();
    }
    if(canSpawn){
      switch (spawnEntity){
        case "enemy1":
          new Enemy1();
          break;
        case "enemy2":
          new Enemy2();
          break;
      }
      canSpawn=false;
      
      respawnTime=random(min,max);
    }
  }
  public void timer(){
    if(millis()-timePassed>=respawnTime){
      canSpawn=true;
      timePassed=millis();
    }
  }
}
