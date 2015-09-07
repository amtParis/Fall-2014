import processing.pdf.*;

int numPdfs = 0;

// create two noise counters that have random starting values
float noiseCounterA = random(100);
float noiseCounterB = random(100);

// create the x and y positions
float x = 0;
float y = 0;

void setup() {

  size(500, 500, OPENGL);
  smooth();
  background(255);

  // start x at screen center
  x = width/2;

  // start y at bottom
  y = height;
}

void draw() {

  stroke(0, 10);
  noFill();

  // create an offset for y using noise
  float yOffset = 400 * noise(noiseCounterA);
  line(x, y, x, y-yOffset);
  line(x, y, x, y-yOffset*.5);
  
  // move x with noise
  x += 4 * noise(noiseCounterB) -2;
  
  // increment counters
  noiseCounterA += .005f;
  noiseCounterB += .01f;

  // reset x if it goes offscreen
  if (x<0 || x > width) { 
    x = random(width);
  }
}


void keyPressed() {
  if( key == 'r'){ 
    background(255);
  }
  else if( key == ' '){
    if(numPdfs > 0 ) endRecord();
    numPdfs++;
    background(255);
    beginRecord(PDF, "Lines2-###.pdf");
  }
  
}

