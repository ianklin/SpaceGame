class GameObject{
  float x,y,w,h;
  PImage sprite;
  public GameObject(float x, float y, float w, float h, String imagekey){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    sprite = imageMap.get(imagekey);
    objects.add(this);
  }
  public GameObject(){
    this.x = 0;
    this.y = 0;
    this.w = 50;
    this.h = 50;
    sprite = new PImage();
    objects.add(this);
  }
  public void show(){
    image(sprite,x-w/2,y-h/2,w,h);
  }
  public void parentUpdate(){
    update();
    show();
  }
  public void update(){
    
  }
}
