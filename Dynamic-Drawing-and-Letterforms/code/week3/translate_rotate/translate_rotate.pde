float angle = 0;

void setup(){
  size(300,300);
}

void draw(){
  
    background(255);
    
    angle += 1;
    
    // draw crosshairs in center
    line(0,height/2,width, height/2);
    line(width/2,0,width/2, height);
    
    rect(0,0,30,30);
    
    rectMode(CENTER);
    pushMatrix();
      translate(width/2,height/2);
      rotate( radians(angle) );
      rect(0,0,30,30);
      translate(20,20);
      rect(0,0,10,10);
    popMatrix();
    
    pushMatrix();
      translate(100,100);
      ellipse(0,0,20,20);
    popMatrix();
}
