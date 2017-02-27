float a, b, h, xpos, ypos, oxpos, oypos, t, ot, d, od;
int x = 50;
int y;
int centerX;
int centerY;
int i = 1;


void setup() {
  //size(300, 300);
  fullScreen();
  colorMode(HSB, 360);
  background(0);
  centerX = width/2;
  centerY = height/2;
  //a = random(round(width));
  b = 60;
  //h = random(round(height));
  frameRate(1000);
}

void draw() {
  //a = mouseX;
  //h = mouseY;
  background(0);
  a = x;
  h = y;
  for (int i = 1; i < 361; i++) {
    t = radians(i); 
    ot = radians(i - 1);
    d = a * t;
    od = a * ot;

    oxpos = (a - b) * cos(ot) + h * cos(od);
    oypos = (a - b) * sin(ot) + h * sin(od);

    xpos = (a - b) * cos(t) + h * cos(d);
    ypos = (a - b) * sin(t) + h * sin(d);


    stroke(i - 1, 360, 360, 150);
    line(centerX + oxpos, centerY + oypos, centerX + xpos, centerY + ypos);

    //if (i < 361) {
    //  i++;
    //} else {
    //  noLoop();
    //  println("Done");
    //}
  }
  if (x < width) {
    if (y < height/4) {
      y++;
    } else if (y >= height/4) {
      y = 0;
      x++;
    }
  } else if (x >= width) {
    x = 0;
  }
  //println("X: " + x + ", Y: " + y);
}

void mouseClicked() {
  println(x + " " + y);
  y = 0;
  x++;
}