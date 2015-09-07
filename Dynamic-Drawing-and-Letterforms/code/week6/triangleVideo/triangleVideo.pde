import processing.video.*;

Capture video;

ArrayList<PVector> positions;

void setup() {
  size(640, 480);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, 160, 120);

  // Start capturing the images from the camera
  video.start();  

  positions = new ArrayList();
}

void captureEvent(Capture c) {
  c.read();
}


void draw() {

  getBrightPositions();

  noStroke();

  if ( positions.size() >  0 ) {
    for (int i = 0; i < 20; i++) {
      int rp = (int)random( 0, positions.size());
      PVector p = positions.get( rp );
      color myColor = video.pixels[ (int)p.z ];

      fill(myColor, 200);
      triangle( p.x, p.y-random(10, 30), p.x-random(10, 30), p.y+random(10, 30), p.x+random(10, 30), p.y+random(10, 30));
    }
  }
}

void getBrightPositions() {

  positions.clear();
  float scaleX = width/video.width;
  float scaleY = height/video.height;

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int i = video.width*y + x;
      float bright = brightness( video.pixels[i]);
      if ( bright > 60 ) {
        positions.add( new PVector(x*scaleX, y*scaleY, i) );
      }
    }
  }
}


