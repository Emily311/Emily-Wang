class Whale {
  // instance variables
  int xPos;
  int yPos;  
  PImage whale2;
  
  // constructor
  Whale(int _xPos, int _yPos) {
    xPos = _xPos;
    yPos = _yPos;
    whale2 = loadImage("sea.jpg");
  }
    
  void t() {
      whale2 = loadImage("whale2.png");
      image(whale2, xPos, xPos);
  }

}
