class Spawner{
  boolean canSpawn;
  int timePassed;
  float respawnTime;
  //Class c;
  public Spawner(){
    canSpawn=true;
    timePassed=0;
    respawnTime=random(1000,1300);
    //c=gameObject;
  }
  public void update(){
    timer();
    if(canSpawn){
      //new c();
      //try{c.newInstance();
      //}
      //catch(InstantiationException ex){
      //  print(ex);
      //}
      //catch(IllegalAccessException ex){
      //  print(ex);
      //}
      if(random(1,3) >= 2){
        new Enemy1();
      } else {
        new Enemy2();
      }
      canSpawn=false;
      respawnTime=random(1000,1300);
    }
  }
  public void timer(){
    if(millis()-timePassed>=respawnTime){
      canSpawn=true;
      timePassed=millis();
    }
  }
}
