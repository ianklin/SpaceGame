class Player extends GameObject{
  boolean canShoot;
  int timePassed;
  int hp;
  boolean takeDamage;
  public Player(){
    super(400,600,50,50,"player", "Player");
    canShoot = true;
    timePassed = 0;
    hp = 25;
    takeDamage = true;
  }
  public void update(){
    text("Points: " + points, 50, 50);
    move();
    hit();
    drawHP();
    shoot();
    reload(800);
    invinciblityTimer(2000);
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
  
  public void invinciblityTimer(int reloadTime){
    if(millis() - timePassed >= reloadTime){
      takeDamage = true;
    }
  }
  public void hit(){
    for(int i = 0; i < objects.size(); i++){
      if((objects.get(i).type == "Enemy Missle" || objects.get(i).type == "Enemy 1") && distance(this, objects.get(i)) <= this.w/2 + objects.get(i).w/2){
        objects.remove(objects.get(i));
        hp -= random(1,5);
        if(hp<=0){
          hp = 0;
          objects.remove(this);
          fill(255,255,255);
          text("You Lost!",380,400,1000,1000);
          noLoop();
        }
      }
    }
    for(int i = 0; i < objects.size(); i++){
      if(objects.get(i).type == "Boss" && distance(this, objects.get(i)) <= this.w/2 + objects.get(i).w/2 && takeDamage == true){
        hp -= random(1,10);
        timePassed = millis();
        takeDamage = false;
        if(hp<=0){
          hp = 0;
          objects.remove(this);
          fill(255,255,255);
          text("You Lost!",380,400,1000,1000);
          noLoop();
        }
      }
    }
  }
  public void drawHP(){
    fill(0,255,0);
    rect(x-75, y-35, hp*5, 10);
  }
}
