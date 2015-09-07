PImage butterfly;
ArrayList<PVector> positions;

void setup(){
  
  butterfly = loadImage("butterfly.png");
  
  size(butterfly.width,butterfly.height);
  
  positions = new ArrayList();
  
  butterfly.loadPixels();
  
  for(int x = 0; x < butterfly.width; x++){
     for(int y = 0; y < butterfly.height; y++){
      int i = butterfly.width*y + x;
      float bright = brightness( butterfly.pixels[i]);
      if( bright < 250 ){
        positions.add( new PVector(x,y,i) );
      }
    }
  }
  
  background(255);
}


void draw(){
  
  
  int rp = (int)random( 0, positions.size());
  PVector p = positions.get( rp );
  color c = butterfly.pixels[ (int)p.z ];
  
  fill(c,200);
  triangle( p.x,p.y-random(10,50),p.x-random(10,50),p.y+random(10,50),p.x+random(10,50),p.y+random(10,50));
  
}
