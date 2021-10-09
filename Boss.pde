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
  float speed;
  int timePassed;
  int waitTime;
  GameObject target;
  public Boss(GameObject target){
    super(400,-100,250,250,"boss", "Boss");
    hp = 50;
    currentMove = BossMoves.MOVEDOWN;
    speed = 5;
    timePassed = 0;
    waitTime = 0;
    this.target = target;
  }
  public void update(){
    if(currentMove == BossMoves.MOVEDOWN){
      y += 4;
      if(y >= 200){
        currentMove = BossMoves.MOVESIDE;
      }
    } else if(currentMove == BossMoves.MOVESIDE){
      if (x <= 200){
        speed *= -1;
      } if (x >= 600){
        speed *= -1;
      }
      x += speed;
    } else if(currentMove == BossMoves.SHOOT1){
      shoot(1);
    } else if(currentMove == BossMoves.COLLIDE){
      collide();
    } else if(currentMove == BossMoves.TRACKPLAYER){
      trackPlayer();
    } else if(currentMove == BossMoves.SHOOT2){
      shoot(2);
    }
    hit();
  }
  public void hit(){
    for (int i = 0; i < objects.size(); i++){
      if (objects.get(i).type == "Missle" && distance(this, objects.get(i)) <= this.w/2 + objects.get(i).w/2){
        hp -= random(1,5);
      }
    }
  }
  public void randomizeMove(){
    int randint = floor(random(0,4));
    if(randint == 0){
      currentMove = BossMoves.MOVESIDE;
    } if (randint == 1){
      timePassed = millis();
      currentMove = BossMoves.TRACKPLAYER;
      //currentMove = BossMoves.SHOOT1;
    } if (randint == 2){
      timePassed = millis();
      currentMove = BossMoves.TRACKPLAYER;
      //currentMove = BossMoves.COLLIDE;
    } if (randint == 3){
      timePassed = millis();
      currentMove = BossMoves.TRACKPLAYER;
    }
  }
  public void shoot(int type){
    if(type == 1){
      
    } else {
      for(int i = 0; i < 4; i++){
        new EnemyMissle(x + random(-125,125),y);
      }
    }
  }
  public void collide(){
    
  }
  public void trackPlayer(){
    waitTime = 1000;
    if(millis() - timePassed == waitTime){
      currentMove = BossMoves.SHOOT2;
    }
    this.speed = (target.x - x)/10;
    x+=speed;
  }
}
