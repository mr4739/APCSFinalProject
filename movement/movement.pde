int x = 0; // this is completely random
PImage img; //loading an image to test
int y = 50; // this is completely random
int xdir = 0;
int ydir = 0;
int placeX = 0;
int placeY = 0;
int score = 0;
int place = 0;
int xdirG = 0;
int ydirG = 0;
int xGhost = 0;
int yGhost = 0;
boolean or = false;
int removedPlace = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  img= loadImage("2000px-Pacman.svg.png");
  
  
}

boolean checkCoord(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y){
  placeX = 0;
  placeY = 0;
    while (placeY < exampleY.size()){
      if (((pow((y - exampleY.get(placeY)), 2)) + (pow((x - exampleX.get(placeY)), 2))) <= 100){
//        if (exampleX.get(placeY) == x){
          removedPlace = placeY;
          println("hello check coord true");
          return true;
//        }
      }
      placeY += 1;
    }
    println("hello check coord false");
    return false;
    
    
}


boolean checkCoordB(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y){
  placeX = 0;
  placeY = 0;
    while (placeY < exampleY.size()){
     if (exampleY.get(placeY) == y){
        if (exampleX.get(placeY) == x){
          println("hello check coord true");
          return true;
        }       
      }
      placeY += 1;
    }
    println("hello blackList check coord false");
    return false;
    
    
}


class setUpCircles{
  boolean on = false;
  
  
  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();

  
  PFont f= createFont("Arial", 25, true);
  int score = 0;

  void addCirclesToArray(){
    

  // (below) : load the circles Pacman is eating
  
  int i1 = 50;
  int i2 = 50;
  
   while(i1 < 1000){
    xStart.add(i1);
    yStart.add(i2);
    i1 += 50;
    i2 += 50;
  }
  println(xStart);
  println(yStart);
  /*
  while(i2 < 1000){
    yStart.add(i2);
    i2 += 50;
  }
  */
  }
  
  
    void update(int x, int y){
      
      if (xStart.isEmpty() && yStart.isEmpty()){
          test.addCirclesToArray();
      }
      
      //println(blackListX);
      //println(blackListY);
      /*
      println(blackListX.indexOf(x) == -1);
      println(blackListY.indexOf(y) == -1);
      println(xStart.indexOf(x) != -1);
      println(yStart.indexOf(y) != -1);
      println(xStart.indexOf(x) == yStart.indexOf(y));
      */
//      int xRecordB = blackListX.indexOf(x);
//      int xRecord = xStart.indexOf(x);
//    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 && yStart.get(xRecord) == y){
      //might need for later: && xStart.indexOf(x) == yStart.indexOf(y)
//    if (blackListX.indexOf(x) == -1 || blackListY.indexOf(y) == -1 || blackListY.get(xRecordB) != y){
//    if (checkCoordB(xStart, yStart, x, y)){
      if (checkCoord(xStart, yStart, x, y)){
//    if (checkCoordB(blackListX, blackListY, x, y) == false){
//      on = true;
        score += 1;
        /*
        xStart.remove((Integer)(x));
        yStart.remove((Integer)(y));
        */
        xStart.remove(removedPlace);
        yStart.remove(removedPlace);
//      blackListX.add(x);
//      blackListY.add(y);
      //println(x + "," + y + "add to blacklist");
      //println(blackListX);
      //println(blackListY);
}
    }
  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  place = 0;
//  int i1 = 50;
//  int i2 = 50;
//  int tracker = blackListX.indexOf(i1);
//  while (i1 < 1000){
//    if (blackListX.indexOf(i1) == -1 || blackListY.indexOf(i2) == -1){
//  if (checkCoordB(blackListX, blackListY, i1, i2) == false){

//      while ((i1 < 1000) && (blackListX.indexOf(i1) == -1 || blackListY.indexOf(i2) == -1 || blackListY.get(tracker) != i2)){
      //while (i1 < 1000 && i2 < 1000){
        //println(i1 + "," + i2 + "add circle");
        while (place < xStart.size() - 1){
//        while(checkCoordB(blackListX, blackListY, i1, i2) == false){
        fill(255);
        ellipse(xStart.get(place), yStart.get(place), radius, radius);
        place += 1;
//        i1 += 50;
//      i2 += 50;
      }
//      }
//      }else{
//        i1 += 50;
//        i2 += 50;
      }
    }

class setUpGhosts{
  
  ArrayList<Integer>snakeX = new ArrayList<Integer>();
  ArrayList<Integer>snakeY = new ArrayList<Integer>();
    
    void drawGhosts(int xG, int yG){
      fill (200);
      ellipse(xG, yG, 30, 30);
      xGhost = xG;
      yGhost = yG;
    }
    
    void updateG(){
      if (x < xGhost){
        xdirG = 0;
      }
    }
}

class setUpCirclesSnake{
  

  int lastxdir = 0;
  int lastydir = 0;
  boolean on = false;
  int score = 0;
  int numberOfCircles = score;
  PFont f= createFont("Arial", 25, true);
  int xCoorTail = 0;
  int yCoorTail = 0;

  
  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();
  
  
  void addCirclesToArray(int x, int y){

    xStart.add(x);
    yStart.add(y);

  }
      
      
    boolean update(int x, int y){
      
      //allow room for error when snaking
      
      /*
      counter = -10;
      x -= -10;
      y -= -10;
      */
      
      on = false;
      
//      while (counter <= 10){
      /*
      println(blackListX.indexOf(x) == -1);
      println(blackListY.indexOf(y) == -1);
      println(xStart.indexOf(x) != -1);
      println(yStart.indexOf(y) != -1);
      println(xStart.indexOf(x) == yStart.indexOf(y));
      */
      //int xRecordB = blackListX.indexOf(x);
//      int xRecord = xStart.indexOf(x);
      //int yRecordB = blackListY.indexOf(y);
//      int yRecord = yStart.indexOf(y);
      
//    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 && (abs(yStart.get(xRecord) - y) <= 10 && abs(xStart.get(yRecord) - x) <= 10)){
  if (checkCoord(xStart, yStart, x, y)){
//  if (checkCoordB(blackListX, blackListY, x, y) == false){
      on = true;

      //
      /*
      //might need for later: && xStart.indexOf(x) == yStart.indexOf(y)
    if (blackListX.indexOf(x) == -1 || blackListY.indexOf(y) == -1 || blackListY.get(xRecordB) != y){
        score += 1;
    }
        blackListX.add(x);
        blackListY.add(y);
        //println(x + "," + y + "add to blacklist");
        //println(blackListX);
        //println(blackListY);
        */

//      blackListX.add(x);
//      blackListY.add(y);
        score += 1;
        return on;
    }
//}
        
     
      println("falseeeee");
      return on;
    }
      
  float randX = random(900);
  float randY = random(600);
  int xcoor = int(randX);
  int ycoor = int(randY);

  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int x, int y, int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  
  
  if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(x, y) == true)){
   randX = random(900);
   randY = random(600);
   xcoor = int(randX);
   ycoor = int(randY);
 
//  int tracker = blackListX.indexOf(xcoor);

//while (blackListX.indexOf(xcoor) != -1 && blackListY.indexOf(ycoor) != -1 && blackListY.get(tracker) == ycoor){ 
 
  while (checkCoordB(blackListX, blackListY, xcoor, ycoor) == true){
   randX = random(900);
   randY = random(600);
   xcoor = int(randX);
   ycoor = int(randY);
  }
  xStart.clear();
  yStart.clear();
  addCirclesToArray(xcoor, ycoor);
  
//  if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(x, y) == true)){
  /*
   counter = -5;
   xcoor -= 5;
   ycoor -= 5;
   while (counter <= 5 && checkCoord(blackListX, blackListY, xcoor, ycoor) == false){
     addCirclesToArray(xcoor, ycoor);
     counter += 1;
     xcoor += 1;
     ycoor += 1;
   }
   xcoor -= 5;
   ycoor -= 5;
   */
  }
  
    fill(100);
    ellipse(xcoor, ycoor, radius, radius);
    if (score != 0){
    numberOfCircles = 1;
  
  xCoorTail = (x + (-1 * (xdir) * 20));
  yCoorTail = (y + (-1 * (ydir) * 20));
    while (numberOfCircles <= score){
      if (xdir != 0){
      ellipse(xCoorTail , y , 20, 20);
      xCoorTail += (-1 * (xdir) * 20);
      }else{
        if (ydir != 0){
          ellipse(x, yCoorTail, 20, 20);
          yCoorTail += (-1 * (ydir) * 20);
        }
      }
      numberOfCircles += 1;      
    }
    }
  }
  }

  

  setUpCircles test = new setUpCircles();
  setUpCirclesSnake test2 = new setUpCirclesSnake();
  setUpGhosts testG = new setUpGhosts();

void draw() {
  or = true;
  if (or == true){
    test2.updateDraw(x, y, 30);
  }else{
//  color c1 = get(x + 20,y); //based on the radius of the moving circle
//  color c2 = get(x,y + 20); //based on the radius of the moving circle
//  if (c1!= 0 || c2 != 0){
  test.update(x,y);
//  }
  //ArrayList<Integer>xcoords = new ArrayList<Integer>();
  //ArrayList<Integer>ycoords = new ArrayList<Integer>();
  //image(img, x, y, 100, 100);
  test.updateDraw(30);
  }
  fill(100);
  ellipse(x, y, 20, 20);

  
  if (x == 50 || x == 850) {
    xdir = 0;
  }
  if (y == 50 || y == 550){
    ydir = 0;
  }
  if (keyPressed) {
    if (x>50 && (key == 'a' || key =='A')) { //go left
      xdir = -1;
      ydir = 0;
    }
    if (x<850 && (key == 'd' || key == 'D')) { //go right
      xdir = 1;
      ydir = 0;
    }
    if (y>50 && (key == 'w' || key =='W')) { //go up
      xdir = 0;
      ydir = -1;
    }
    if ((key == 's' || key == 'S') && y<550) { //go down
      xdir = 0;
      ydir = 1;
    }
  }
  x += xdir;
  y += ydir;
  //fill(255);
  //ellipse(x, y, 10, 10);
  //println(x + "," + y);

  
}
