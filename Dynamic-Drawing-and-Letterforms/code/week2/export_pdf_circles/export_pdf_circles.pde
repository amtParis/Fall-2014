import processing.pdf.*;

boolean saveToPdf = false;

void setup(){
  size(400,400);
}

void draw(){
  
  if(saveToPdf == true){
    beginRecord(PDF,"mysketch.pdf");
  }
  
  background(255);
  lovelyBlueCircles(30,30);
  lovelyBlueCircles(20,150);
  lovelyBlueCircles(300,300);
  
  if(saveToPdf == true){
    endRecord();
    saveToPdf = false;
  }
}

void keyPressed(){
  if( key == ' ' ){
    saveToPdf = true;
  }
}

void lovelyBlueCircles(int x, int y){
  fill(150,200,255,100);
  ellipse(x,y,100,100);
  fill(150,255,255,100);
  ellipse(x,y,80,80);
  fill(200,200,255,100);
  ellipse(x,y,60,60);
}
