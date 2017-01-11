

class SnakeBit {
  
  float x;
  float y;
  char direction;
  
  SnakeBit(){
    x = 0;
    y = 0;
    direction = 'r';
  }
  
  SnakeBit(SnakeBit pbit){
    x = pbit.x - 10;
    y = pbit.y;
    direction = pbit.direction;
  }
  
  
  boolean updateHead(SnakeBit[] bitly, food khana){
    
    if(x > width/2 ) x = -width/2;
    if(x < -width/2 ) x = width/2;
    if(y > height/2 ) y = -height/2;
    if(y < -height/2 ) y = height/2;
    switch(direction){
    case 'u': y = y - 10; break; 
    case 'd': y = y + 10; break;
    case 'l': x = x - 10; break;
    case 'r': x = x + 10; break;
    default:
      println("something is very wrong");}
    
    for(int i = 1 ; i < len ; i++ ){
      if(bitly[i].x == x && bit[i].y == y){
        exit();
      }
    }
    String s="false";
    if((khana.x - 10 < x && khana.x + 10 > x) && (khana.y - 10 < y && khana.y + 10 > y)) {
      len = len + 1;
      s = "true";
    }
    return boolean(s);
  }
  
  void updateBody(SnakeBit bit){
    direction = bit.direction;
    x = bit.x;
    y = bit.y;  
  }
  
  void showHead(){
    fill(255);
    noStroke();
    ellipse(x,y-8,10,20);
  }
  
  void showBody(){
    fill(255);
    noStroke();
    ellipse(x,y,10,10);
  }

}