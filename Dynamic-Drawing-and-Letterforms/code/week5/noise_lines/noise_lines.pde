/*
Draws continous lines with noise distortion in y direction
 */

float x = -1;
float y = 0;
float px = 0;
float py = 0;
float noiseCounter = random(100);

void setup() {
  size(400, 400,OPENGL);
  y = height/2;//random(50, height-50);
  py = y;
  background(255);
  smooth();
}

void draw() {


  if (x>width) {
    //x = 0;
    y = random(50, height-50);
    px = x;
    py = y;
  }

  float yOffset = (50 * noise(noiseCounter) ) - 25;
  line(px, py, x, y+yOffset);
  
  px = x;
  py = y+yOffset;
    x++;

  noiseCounter += .02;
}

