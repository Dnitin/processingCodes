class Invader {
  int dir;
  PImage look;
  int homey;
  int homex;
  int x;
  int y;
  boolean show;


Invader(PImage l, int x, int y){
  this.dir = 1; 
  this.look = l;
  homex = x;
  homey = y;
  this.x = x;
  this.y = y;
  this.show = true;
}

void destruct(Ammo kill){
  if(kill.x < x + 25 && kill.x > x && kill.y < y + 25 && kill.y > y )
    show = false;
}

void movedown(){
  homey = homey+1;
}

void move(){
  if(show == false) return ; 
  float v = random(-2,2);
  if(x >= homex + 50) dir = -1 ;
  if(x <= homex - 50) dir = 1;
  x = x + dir;
  y = y + (int)v;
  if(y >= homey + 2 || y <= homey-2) y = homey; 
}

void show(){
  if(show == false) return;
  image(look, x, y);
  move();
  }
}