class Background extends GameObject{
  public Background(){
    super(400,400,800,1400, "spacebackground");
  }
  public void update(){
    move();
  }
  public void move(){
    y+=3;
    if(y >= 1500){
      y = -700;
    }
  }
}
