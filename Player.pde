class Player extends GameObject{
  public Player(){
    super(400,600,50,50,"player");
  }
  public void update(){
    move();
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
}
