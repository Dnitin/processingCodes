PImage img,back,shipimg;
int invaderCount = 0;
PFont f;
Invader[] invaders = new Invader[17];
Ammo[] ammos = new Ammo[200];
Ship ship;
int ammoUsed=0;

void setup() {
  size(965,506);
  //translate(width/2,height/2);
  f = createFont("Arial",16,true); // STEP 2 Create Font
  img = loadImage("space_invader.png");
  back = loadImage("spacebck2.jpg");
  shipimg = loadImage("ship.png");
  back.resize(965,506);
  img.resize(35,25);
  ship = new Ship(shipimg);
  shipimg.resize(50,50);
  for(int i = 65 ; i < width ; i = i+100 ){
    invaders[invaderCount] = new Invader(img,i,20);
    invaderCount = invaderCount + 1 ;
  }
  for(int i = 115 ; i < width - 50 ; i = i+100 ){
    invaders[invaderCount] = new Invader(img,i,60);
    invaderCount = invaderCount + 1 ;
  }
  
}

void draw() {
  background(back);
  textSize(15);                  
  fill(255, 102, 153);                      
  text("Remaining Ammo!",width/2 + 340,height/2-140);
  textSize(20);                  
  fill(165, 175, 192); 
  text(200-ammoUsed,width/2 + 340,height/2-120);
  ship.show();
  ship.move();
  for(int i = 0; i < ammoUsed ; i++ ) {
    if(ammos[i].show == true){
      for(int j = 0; j < 17 ; j++ ) {
        invaders[j].destruct(ammos[i]);
        ammos[i].show = invaders[j].show;
      }
    }
  }
  
  for(int i = 0; i < invaderCount ; i++ ) {
    invaders[i].show();
  }
  for(int i = 0; i < ammoUsed ; i++ ) {
    ammos[i].show();
  }
}

  void keyReleased(){
   switch(keyCode){
    case 32:  break ;
    case 37: ship.movedir = 0 ; break ;
    case 39: ship.movedir = 0  ; break ;
    default : 
      println("kuch toota");
  } 
  }
  
  void keyPressed() {
  switch(keyCode){
    case 32: ammos[ammoUsed++] = new Ammo(ship.x); break ;
    case 37: ship.movedir = -1 ; break ;
    case 39: ship.movedir = 1  ; break ;
    default : 
      println("kuch toota");
  }
}