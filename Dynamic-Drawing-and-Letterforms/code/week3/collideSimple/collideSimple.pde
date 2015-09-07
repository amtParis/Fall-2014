float x = 0;
float y = 0;
float velX = 0;
float velY = 0;
float radiusMe = 10;

float aX = 0;
float aY = 0;
float radius = 20;


void setup(){
  
  size(300,300);
  aX = random(width);
  aY = random(height);
}


void draw(){
  
  background(255);
  ellipse(x,y,radiusMe*2,radiusMe*2);
  
  float distance = dist(x,y,aX,aY);
  if( distance < radius+radiusMe ){
    fill(255,0,0);
  }else{
    fill(255);
  }
  ellipse(aX,aY,radius*2,radius*2);
  
  x += velX;
  y += velY;
  
  velX -= velX * .1;
  velY -= velY * .1;
  
}

void keyPressed(){
  
  if( key == 'r'){
    x = width/2;
    y = height/2;
  }
  
  
  if( key == CODED){
     if( keyCode == UP){
       // up arrow
       velY -= 2;
     }else if( keyCode == DOWN){
       velY += 2;
     }else if( keyCode == RIGHT){
       velX += 2;
     } else if( keyCode == LEFT){
       velX -= 2;
     }  
  }
  
}
