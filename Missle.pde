class Missle extends GameObject{
  float speed;
  public Missle(float x,float y){
    super(x,y,14,50,"missle", "Missle");
    speed = random(3,8);
  }
  public void update(){
    y -= speed;
  }
}
