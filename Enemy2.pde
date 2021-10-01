class Enemy2 extends GameObject{
  int shootTime;
  int timePassed;
  boolean canShoot;
  //float shootRandomizer;
  public Enemy2(){
    super(random(50,750),-100,50,50,"enemy2", "Enemy 2");
    timePassed = 0;
    canShoot = true;
    shootTime = 800;
    //shootRandomizer = random(1,4);
  }
  public void update(){
    y += 6;
    hit();
    shoot();
  }
  public void hit(){
    for (int i = 0; i < objects.size(); i++){
      if (objects.get(i).type == "Missle" && distance(this, objects.get(i)) <= this.w/2 + objects.get(i).w/2){
        objects.remove(objects.get(i));
        objects.remove(this);
        points += 100;
      }
    }
  }
  public void shoot(){
    if(canShoot){
      new EnemyMissle(x,y);
      canShoot = false;
      //shootRandomizer = random(1,4);
    }
  }
  public void reload(){
    if(millis() - timePassed >= shootTime){
      timePassed = millis();
      canShoot = true;
    }
  }
}
