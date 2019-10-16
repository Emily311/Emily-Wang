PImage fish;
PImage bg;
PImage whale1;
PImage whale2;
int mirrorHeight = 270;
int fishX = 0;
Whale[] waleList = new Whale[5];
Fall[] falls = new Fall[400];
int k = 0;
void setup() {
  size(1043, 509);  
  fish = loadImage("fish.png");
  bg = loadImage("sea.png");
  whale1 = loadImage("whale1.png");
  whale2 = loadImage("whale2.png");  
  for (int i = 0; i < falls.length; i ++) {
    falls[i] = new Fall ();
  }
}

void draw() {
  background(bg);  
  stroke(226, 204, 0);
  line(0,mirrorHeight, width, mirrorHeight);
  
  image(fish, fishX++, 350);
  
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
