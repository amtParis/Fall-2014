/*
Draws continous lines with random distortion in y direction
 */

float x = 0;
float y = 0;
float px = 0;
float py = 0;

void setup() {
  size(400, 400);
  y = random(50, height-50);
  py = y;
  background(255);
}

void draw() {

  if (x>width) {
   // x = 0;
    y = random(50, height-50);
    px = x;
    py = y;
  }

  float yOffset = random(-25, 25);
  line(px, py, x, y+yOffset);

  px = x;
  py = y+yOffset;
  x++;
}

