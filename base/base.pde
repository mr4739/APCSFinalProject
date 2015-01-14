PImage img;

int x = 450;
int y = 300;
int xdir = 0;
int ydir = 0;
color wall = color(21, 56, 255);

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  img = loadImage("exp2.png");
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  ellipse(x, y, 26, 26);

  color cright = get(x+13, y);
  color cleft = get(x-14, y);
  color cup = get(x, y-14);
  color cdown = get(x, y+13);
  boolean goRight = true;
  boolean goLeft = true;
  boolean goUp = true;
  boolean goDown = true;
  color cupleft = get(x-14, y-14);
  color cupright = get(x+14, y-14);
  color cdownleft = get(x-14, y+14);
  color cdownright = get(x+14, y+14);
  
  color exp = get(x,y+12);
  println(getRGB(exp));
  //right (x+12,y)
  //left (x-13,y)
  //up (x,y-13)
  //down (x, y+12);
  
  
  
  /*
 if (checkWalls(y-14,y+13,x-14)){
   println("wall!!!!!");
   }
   */
  if (getRGB(cright).equals("2156255")) {
    goRight = false;
  }
  if (getRGB(cleft).equals("2156255")) {
    goLeft = false;
  }
  if (getRGB(cup).equals("2156255")) {
    goUp = false;
  }
  if (getRGB(cdown).equals("2156255")) {
    goDown = false;
  }

  if (keyPressed) {
    if ((key == 'a' || key =='A') && 
      (((getRGB(cleft)).equals("000")) ||
      (((getRGB(cupleft)).equals("000")) &&
      ((getRGB(cdownleft)).equals("000")) &&
      ((getRGB(cleft)).equals("000")))) &&
      (!(checkWalls(y-13, y+12, x-14)))) { //go left
      xdir = -1;
      ydir = 0;
    }
    if ((key == 'd' || key == 'D') && 
      (((getRGB(cright)).equals("000")) ||
      (((getRGB(cupright)).equals("000")) && 
      ((getRGB(cdownright)).equals("000")) &&
      ((getRGB(cright)).equals("000")))) &&
      (!(checkWalls(y-13, y+12, x+13)))) { //go right
      xdir = 1;
      ydir = 0;
    }
    if ((key == 'w' || key =='W') && 
      (((getRGB(cup)).equals("000")) ||
      (((getRGB(cupleft)).equals("000")) &&
      ((getRGB(cupright)).equals("000")) &&
      ((getRGB(cup)).equals("000")))) &&
      (!(checkWalls(x-13, x+12, y-14)))) { //go up
      xdir = 0;
      ydir = -1;
    }
    
    if ((key == 's' || key == 'S') && 
     (((getRGB(cdown)).equals("000")) || 
     (((getRGB(cdownleft)).equals("000")) && 
     ((getRGB(cdownright)).equals("000")) &&
     ((getRGB(cdown)).equals("000")))) &&
     (!(checkWalls(x-13, x+12, y+13)))) { //go down
     xdir = 0;
     ydir = 1;
     }
     
/*
    if ((key == 's' || key == 'S') && 
      (!(checkWalls(x-13, x+13, y+14)))) { //go down
      xdir = 0;
      ydir = 1;
    }
    */
  }

  color i = get((x+(13*xdir)), (y+(13*ydir)));
  if ((getRGB(i).equals("2156255"))) {
    xdir = 0;
    ydir = 0;
  }

  x += xdir;
  y += ydir;
}



/*
if ((getRGB(cright).equals("2156255")) || (getRGB(cleft).equals("2156255"))){
 xdir = 0;
 }
 if ((getRGB(cup).equals("2156255")) || (getRGB(cdown).equals("2156255"))){
 ydir = 0;
 }
 */
/*
  if (keyPressed) {
 if ((key == 'a' || key =='A') && 
 (((getRGB(cleft)).equals("000")) ||
 (((getRGB(cupleft)).equals("000")) &&
 ((getRGB(cdownleft)).equals("000")) &&
 ((getRGB(cleft)).equals("000"))))){ //go left
 xdir = -1;
 ydir = 0;
 }
 if ((key == 'd' || key == 'D') && 
 (((getRGB(cright)).equals("000")) ||
 (((getRGB(cupright)).equals("000")) && 
 ((getRGB(cdownright)).equals("000")) &&
 ((getRGB(cright)).equals("000"))))) { //go right
 xdir = 1;
 ydir = 0;
 }
 if ((key == 'w' || key =='W') &&
 (((getRGB(cup)).equals("000")) ||
 (((getRGB(cupleft)).equals("000")) &&
 ((getRGB(cupright)).equals("000")) &&
 ((getRGB(cup)).equals("000"))))) { //go up
 xdir = 0;
 ydir = -1;
 }
 if ((key == 's' || key == 'S') && 
 (((getRGB(cdown)).equals("000")) || 
 (((getRGB(cdownleft)).equals("000")) && 
 ((getRGB(cdownright)).equals("000")) &&
 ((getRGB(cdown)).equals("000"))))) { //go down
 xdir = 0;
 ydir = 1;
 }
 }
 x += xdir;
 y += ydir;
 
 color i = get((x+(14*xdir)),(y+(14*ydir)));
 if ((getRGB(i).equals("2156255"))){
 xdir = 0;
 ydir = 0; 
 }
 
 }
 */

String getRGB(color col) {
  return ""+(int)red(col)+(int)green(col)+(int)blue(col);
}

/*
boolean checkWalls(int startCoor, int endCoor, int bound) {
  while ((startCoor + 1) != (endCoor - 1))
    color temp = get(startCoor, bound);
    if ((bound == x-13) || (bound == x+13)) {
      temp = get(bound, startCoor);
    }
    if (getRGB(temp).equals("000")) {
      println("woof");
      startCoor++;
    } else {
      return true;
    }
  }
  return false;
}
*/

boolean checkWalls(int startCoor, int endCoor, int bound) {
  while (startCoor != endCoor) {
    color temp = get(startCoor, bound);
    if ((bound == x-13) || (bound == x+13)) {
      temp = get(bound, startCoor);
    }
    if (getRGB(temp).equals("2156255")) {
      println("woof");
      return true;
    } else {
      startCoor++;
    }
  }
  return false;
}

