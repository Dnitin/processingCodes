class Ammo {

  int x;
  int y;
  boolean show;
  
  Ammo(int x ){
    this.x = x+25;
    this.y = height-80;
    this.show = true;
  }
  
  void destruct(){
    show = false;
  }
  
  void move(){
    if(show == false) return ;
    y = y - 3;
  }
  
  void show(){
    if(y < 0) show = false ; 
    if(show == false) return ;
    move();
    ellipse(x,y,5,10);
  } 
}