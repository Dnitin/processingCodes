
SnakeBit[] bit = new SnakeBit[40];
food foo = new food();
int len = 3;

void setup() {
  
  size(640, 360); //<>//
  bit[0] = new SnakeBit();
  for(int i=1;i<len;i++){
    bit[i] = new SnakeBit(bit[i-1]);
  } 
}

void draw() {
  translate(width/2, height/2);
  background(0);
  foo.show();
  for(int i=len-2;i>=0;i--){
    bit[i+1].updateBody(bit[i]);
    bit[i+1].showBody();
  } 
  if(bit[0].updateHead(bit,foo)){
    bit[len-1] = new SnakeBit(bit[len-2]);
    foo = new food();
  }
  bit[0].showHead();
  delay((int)map(len,3,40,70,20));
}

void keyPressed() {
  println("kuch hua");
  switch(keyCode){
    case 38: if(bit[0].direction != 'd') bit[0].direction = 'u'; break ;
    case 40: if(bit[0].direction != 'u') bit[0].direction = 'd'; break ;
    case 37: if(bit[0].direction != 'r') bit[0].direction = 'l'; break ;
    case 39: if(bit[0].direction != 'l') bit[0].direction = 'r'; break ;
    default : 
      println("kuch toota");
  }
}