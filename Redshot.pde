class Redshot extends GameObject{
  GameObject target;
  float speedX, speedY;
  public Redshot(int x, int y, GameObject target){
    super(x, y, 10, 10, "redshot", "Redshot");
    this.target = target;
    this.speedX = (target.x - x)/10;
    this.speedY = (target.y - y)/10;
  }
  public void update(){
    
  }
}
