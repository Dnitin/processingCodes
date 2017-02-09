class Ship {

  PImage look;
  int x;
  int y;
  int movedir;
  
  Ship(PImage l){
    this.look = l;
    this.x = width/2;
    this.y = height-80;
    this.movedir = 0;
  }
  
  void move(){
    if(x >= 0 && x <= width-50)
      x = x + movedir*5 ;
    else
      x = (x < 0) ? 0 : width-50;
  }
  
  void show(){
    image(look, x, y);
  }
}