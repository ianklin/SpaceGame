class Player extends GameObject{
  boolean canShoot;
  int timePassed;
  public Player(){
    super(400,600,50,50,"player", "Player");
    canShoot = true;
    timePassed = 0;
  }
  public void update(){
    move();
    shoot();
    reload(1000);
  }
  public void move(){
    if(upKey){
      y-=5;
    }
    if(downKey){
      y+=5;
    }
    if(leftKey){
      x-=5;  
    }
    if(rightKey){
      x+=5;
    }
  }
  public void shoot(){
    if(spaceKey && canShoot){
      new Missle(x,y);
      canShoot = false;
    }
  }
  public void reload(int reloadTime){
    if(millis() - timePassed >= reloadTime){
      timePassed = millis();
      canShoot = true;
    }
  }
}
