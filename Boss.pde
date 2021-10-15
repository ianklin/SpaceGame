enum BossMoves{
  MOVEDOWN,
  MOVESIDE,
  SHOOT1,
  SHOOT2,
  COLLIDE, 
  RETURNUP,
  TRACKPLAYER,
  DEAD
}

class Boss extends GameObject{
  int hp;
  BossMoves currentMove;
  int timePassed;
  int waitTime;
  GameObject target;
  int redshotCount;
  float speedX, speedY;
  public Boss(GameObject target){
    super(400,-100,250,250,"boss", "Boss");
    hp = 50;
    currentMove = BossMoves.MOVEDOWN;
    speedX = 5;
    speedY = 0;
    timePassed = 0;
    waitTime = 0;
    this.target = target;
    redshotCount = 0;
  }
  public void update(){
    if(currentMove == BossMoves.MOVEDOWN){
      y += 4;
      if(y >= 200){
        currentMove = BossMoves.MOVESIDE;
        timePassed = millis();
        waitTime = 5000;
      }
    } else if(currentMove == BossMoves.MOVESIDE){
      if (millis() - timePassed >= waitTime){
        randomizeMove();
      }
      if (x <= 200){
        speedX *= -1;
      } if (x >= 600){
        speedX *= -1;
      }
      x += speedX;
    } else if(currentMove == BossMoves.SHOOT1){
      waitTime = 750;
      shoot(1);
    } else if(currentMove == BossMoves.SHOOT2){
      shoot(2);
    } else if(currentMove == BossMoves.COLLIDE){
      collide();
    }  else if(currentMove == BossMoves.RETURNUP){
      returnUp();
    } else if(currentMove == BossMoves.TRACKPLAYER){
      trackPlayer();
    }
    hit();
    drawHP();
  }
  public void hit(){
    for (int i = 0; i < objects.size(); i++){
      if (objects.get(i).type == "Missle" && distance(this, objects.get(i)) <= this.w/2 + objects.get(i).w/2){
        objects.remove(objects.get(i));
        hp -= random(1,5);
      }
    }
     if(hp<=0){
       hp = 0;
     }
  }
  public void randomizeMove(){
    int randint = floor(random(0,4));
    if(randint == 0){
      timePassed = millis();
      currentMove = BossMoves.MOVESIDE;
    } if (randint == 1){
      timePassed = millis();
      currentMove = BossMoves.SHOOT1;
    } if (randint == 2){
      timePassed = millis();
      this.speedX = (target.x - x)/10;
      this.speedY = (target.y - y)/10;
      currentMove = BossMoves.COLLIDE;
    } if (randint == 3){
      timePassed = millis();
      currentMove = BossMoves.TRACKPLAYER;
    }
  }
  public void shoot(int type){
    if(type == 1){
      if(millis() - timePassed >= waitTime){
        redshotCount++;
        new Redshot(x + random(-125,125), y, target);
        timePassed = millis();
      }
    } else {
      for(int i = 0; i < 6; i++){
        new EnemyMissle(x + random(-125,125),y);
      }
      redshotCount = 4;
    }
    if(redshotCount == 4){
      timePassed = millis();
      if(floor(random(0,2)) == 0){
        speedX = 5;
      } else {
        speedX = -5;
      }
      redshotCount = 0;
      waitTime = 3000;
      currentMove = BossMoves.MOVESIDE;
    }
  }
  public void collide(){
    x += speedX;
    y += speedY;
    if(y >= target.y){
      speedY = (200-y)/20;
      currentMove = BossMoves.RETURNUP;
    }
  }
  public void returnUp(){
    y += speedY;
    if(y <= 200){
      if(floor(random(0,2)) == 0){
        speedX = 5;
      } else {
        speedX = -5;
      }
      currentMove = BossMoves.MOVESIDE;
      timePassed = millis();
      waitTime = 5000;
    }
  }
  public void trackPlayer(){
    waitTime = 3000;
    if(millis() - timePassed >= waitTime){
      currentMove = BossMoves.SHOOT2;
    }
    this.speedX = (target.x - x)/10;
    x+=speedX;
  }
  public void drawHP(){
    fill(0,255,0);
    rect(x-125, y-135, hp*5, 10);
  }
}
