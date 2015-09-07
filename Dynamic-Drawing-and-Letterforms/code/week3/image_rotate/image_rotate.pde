PImage penguin;
PImage icecream;
float angle = 0;

void setup(){
  size(300,300);
  penguin = loadImage("penguin.png");
  icecream = loadImage("icecream.png");
}

void draw(){
  
  background(255);
  imageMode(CENTER);
  pushMatrix();
  translate(150,150);
  rotate( radians(angle) );
  image( penguin, 0,0);
  translate(50,0);
  image(icecream,0,0,icecream.width*.25,icecream.height*.25);
  popMatrix();
  
  pushMatrix();
  translate(150,150);
  rotate( radians(-angle) );
  translate(50,0);
  image(icecream,0,0,icecream.width*.25,icecream.height*.25);
  popMatrix();
  
  angle -= 2;
}
