
class Dot {
  float[] closex;
  float[] closey;
  float[] dist;
  float x;
  float y;
  float direction; // can range from 0 to 360
  float scalar1, scalar2;
  
  Dot() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    direction = random(180);
    float random = random(10);
    scalar1 = (random>5) ? 1 : -1;
    scalar2 = (random>5) ? 1 : -1;
  }
  
  void changeDirection(){
    direction = random(180);
    float random = random(10);
    scalar1 = (random>5) ? 1 : -1;
    scalar2 = (random>5) ? 1 : -1;
  }
  
  void updateClose(float[] closedotx,float[] closedoty,float[] dis){
    closex = new float[leng*leng];
    closey = new float[leng*leng];
    dist = new float[leng*leng];
    for(int i = 0 ; i < closedotx.length; i++ ){
      closex[i] = closedotx[i];
      closey[i] = closedoty[i];
      dist[i] = dis[i];
      }
  }
  
  void nullClose(){
    closex = null;
    closey = null;
    dist = null ;
  }
  
    void update(){
    if(x < -width/2 || x > width/2 || y < -height/2 || y > height/2  )
      changeDirection();
    float angle = radians(direction);
      x = x + speed*scalar1*cos(angle) ;
      y = y + speed*scalar2*sin(angle) ;
  }
  
  
  void show(){
    fill(255);
    noStroke();
    ellipse(x,y,5,5);
    if(closex != null)
    for(int i=0;i<closex.length-1;i++){
      if(closex[i]!=0){
        //println(dist[i]);
        stroke(map(dist[i],0,100,255,15));
        line(x,y,closex[i],closey[i]);
      }
      }
  }
}