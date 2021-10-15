class Redshot extends GameObject{
  GameObject target;
  float speedX, speedY;
  public Redshot(float x, float y, GameObject target){
    super(x, y, 20, 20, "redshot", "Enemy Missle");
    this.target = target;
    this.speedX = (target.x - x)/25;
    this.speedY = (target.y - y)/25;
  }
  public void update(){
    x += speedX;
    y += speedY;
  }
}
