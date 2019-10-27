PImage fish;
PImage bg;
PImage whale1;
PImage whale2;
int mirrorHeight = 270;
int fishX = 0;
int fishDeltX = 3;

//import processing.sound.*;
//SoundFile file;
//String audioName = "sample.mp3";
//String path;

Whale[] waleList = new Whale[5];
Fall[] falls = new Fall[400];
PImage[] seaBG = new PImage[5];
int k = 0;
int bgCnt = 0;
void setup() {
  //size(1043, 509);  
  //bg = loadImage("sea.png");
  
  //size(444, 250);  
  //bg = loadImage("sea3.gif");
  
  size(1024, 819);  
  bg = loadImage("sea4.gif");
  seaBG[0] = loadImage("sea4-1.png");
  seaBG[1] = loadImage("sea4-2.png");
  seaBG[2] = loadImage("sea4-3.png");
  seaBG[3] = loadImage("sea4-4.png");
  seaBG[4] = loadImage("sea4-5.png");
  
  fish = loadImage("fish.png");
  whale1 = loadImage("whale1.png");
  whale2 = loadImage("whale2.png");  
  for (int i = 0; i < falls.length; i ++) {
    falls[i] = new Fall ();
  }
}

void draw() {
  background(seaBG[bgCnt%5]);  
  bgCnt++;
  stroke(226, 204, 0);
  line(0,mirrorHeight, width, mirrorHeight);
  
  // fish
  if (fishX > 800 || fishX < 0) {
       fishDeltX = fishDeltX * -1;
  } 
  fishX = fishX + fishDeltX;
  image(fish, fishX, 350);
  
  int deltX = 0;
  int deltY = 0;
  
  int tX = mouseX - pmouseX;
  if (mouseY < mirrorHeight)  {    
      image(whale2, mouseX, 50);
  } else {    
      image(whale2, 350+deltX+tX, 50);
  }
  int newPosX = mouseX-80 > 80 ? (mouseX-80) : 65;
  image(whale1, newPosX-100, mouseY-100);
  for (int i = 0; i < 5; i++) {
      if (waleList[i] != null) {
           waleList[i].t(); 
      }
  }
  
  
  
  
    // snowflake action
  for (int i = 0; i < falls.length; i ++) {
    falls[i].flakes(); // call snowflakes
    falls[i].snowing (); //call snowflakes
    
  }
  
}


void mousePressed() {
  waleList[k%5] = new Whale(mouseX, mouseX);
  waleList[k%5].t();
  k++;
}
