
int leng = 100;
int speed = 1 ; 
Dot[] dots = new Dot[leng];
float[] cx;
float[] cy;
float[] dist;
float len=150;
float distance(Dot d1, Dot d2){
  float dis = sqrt((d1.x-d2.x)*(d1.x-d2.x) + (d1.y-d2.y)*(d1.y-d2.y));
  //print(dis,"  ");
  return dis;
}

void setup() {
  size(900, 600);
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Dot();
  }
}

void draw() {
  translate(width/2, height/2);
  background(0);
  int p = 0;
  for(int i=0 ; i < dots.length ; i++){
    p=0;
    cx = new float[leng*leng];
    cy = new float[leng*leng];
    dist = new float[leng*leng];
    for(int j = i+1; j < dots.length; j++){
      float dis = distance(dots[i],dots[j]);
      if(dis<len){
        p = p + 1;
        cx[p] = dots[j].x; //<>//
        cy[p] = dots[j].y;
        dist[p] = dis;
        //println(cx[p],cy[p]);
      }
    }
    if(cx.length>0) {
      dots[i].updateClose(cx,cy,dist);
    }
    else 
      dots[i].nullClose();
  }
  
  for (int i = 0; i < dots.length; i++) {
    dots[i].update();
    dots[i].show();
    dots[i].nullClose();
  }
}