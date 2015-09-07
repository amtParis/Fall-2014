/*
* https://github.com/recyclism/Corrupt.Processing
* Coded initially in 2004 Benjamin Gaulon, then ported to PHP for corrupt.recyclism.com 
* More info on www.recyclism.com/corrupt.php
* Feel free to use / modify / Share this
* No License
*/


PImage img;
String fileName = "landscape"; // You file name here (should be in the DATA Folder)
String fileExt = ".jpg"; // file extansion (works best with JPG or PNG)

void setup() {
  img = loadImage(fileName + fileExt);
  size(img.width, img.height);
  byte b[] = loadBytes(fileName + fileExt);
  for (int j = 0; j < 30; j ++) // change 30 to any value to generate more images
  {
    byte bCopy[] = new byte[b.length];
    arrayCopy(b, bCopy);
    // load binary of file
    int scrambleStart = 10;
    // scramble start excludes 10 bytes///
    int scrambleEnd = b.length;
    // scramble end ///
    int nbOfReplacements = int (random(1, 10));
    // Number of Replacements - Go easy with this as too much will just kill the file ///
    // Swap bits ///
    for (int i = 0; i < nbOfReplacements; i++)
    {
      int PosA = int(random (scrambleStart, scrambleEnd));
      int PosB = int(random (scrambleStart, scrambleEnd));
      byte tmp = bCopy[PosA];
      bCopy[PosA] = bCopy[PosB];
      bCopy[PosB] = tmp;
    }
    // Save the file in "corrupted" folder ///
    saveBytes("./results/"+fileName + Integer.toString(j) + fileExt, bCopy);
  }
  
    img = loadImage("../results/"+fileName + 0 + fileExt);

}


void draw(){
  image(img,0,0);
}

int count = 0;

void keyPressed(){
  count++;
  if(count >= 30) count = 0;
  img = loadImage("../results/"+fileName + count + fileExt);

}

