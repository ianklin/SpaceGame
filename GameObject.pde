class GameObject{
  float x,y,w,h;
  PImage sprite;
  String type;
  public GameObject(float x, float y, float w, float h, String imagekey, String type){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    sprite = imageMap.get(imagekey);
    this.type = type;
    objects.add(this);
  }
  public GameObject(){
    this.x = 0;
    this.y = 0;
    this.w = 50;
    this.h = 50;
    sprite = new PImage();
    type = "Game Object";
    objects.add(this);
  }
  public void show(){
    image(sprite,x-w/2,y-h/2,w,h);
  }
  public void parentUpdate(){
    show();
    update();
  }
  public void update(){
    
  }
}
