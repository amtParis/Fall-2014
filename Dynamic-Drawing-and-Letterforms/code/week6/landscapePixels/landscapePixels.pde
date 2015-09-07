PImage landscape;
ArrayList<PVector> pts;
int direction = 0;

void setup(){
  landscape = loadImage("landscape.png");
  size(landscape.width, landscape.height);
  pts = new ArrayList();
}

void draw(){
  
  image(landscape,0,0);
  
}

void mousePressed(){
  pts.clear();
  if( abs(mouseX-0) > abs(mouseX-width)){
    direction = 0;
  }else{
    direction = 1;
  }
  
}

void mouseDragged(){
  if(mouseX >= 0 && mouseX < width && mouseY>=0 && mouseY < height){
    pts.add( new PVector(mouseX,mouseY) );
  }
}

void mouseReleased(){
  makePixelStrip();
}

void makePixelStrip(){
  landscape.loadPixels();
  for(int i = 0; i < pts.size(); i++){
    PVector p = pts.get(i);
    int index = int(p.x + p.y * width);
    color c = landscape.pixels[index];
    
    if( direction == 0){
      for(int x = (int)p.x; x < width; x++){
        int pix = x + (int)p.y * width;
        landscape.pixels[pix] = c;
      }
    }else{
        for(int x = (int)p.x; x >= 0; x--){
        int pix = x + (int)p.y * width;
        landscape.pixels[pix] = c;
      }
    }
    
    
  }
  landscape.updatePixels();
}

