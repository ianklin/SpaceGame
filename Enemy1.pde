class Enemy1 extends GameObject{
  public Enemy1(){
    super(random(50,750),-100,50,50,"enemy1", "Enemy 1");
  }
  public void update(){
    y += 4;
    hit();
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
}
