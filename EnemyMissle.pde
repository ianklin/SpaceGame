class EnemyMissle extends GameObject{
  float speed;
  public EnemyMissle(float x,float y){
    super(x,y,14,50,"enemymissle", "Enemy Missle");
    speed = random(9,11);
  }
  public void update(){
    y += speed;
  }
}
