
class food{
float x;
float y;

food(){
  x = random(-width/2,width/2);
  y = random(-height/2,height/2);
}

void show(){
  fill(random(255),random(255),random(255));
  ellipse(x,y,8,8);
  }
}