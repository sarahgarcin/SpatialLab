import oscP5.*;
import netP5.*;

// make osc object
OscP5 oscP5;

// Create array of circles
int countCircle=1;
ArrayList circles;

// variables that store received mouth width and height
float mouthWidth = 0;
float mouthHeight = 0;

PVector poseOrientation = new PVector();
float poseScale;
float xPos, yPos, xDir, yDir;

void setup() {
  size(640, 480);
  smooth();
  noStroke();
  circles = new ArrayList();

  // note: port needs to match FaceOSC port
  oscP5 = new OscP5(this, 8338);
  
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "gotMouthWidth", "/gesture/mouth/width");
  oscP5.plug(this, "gotMouthHeight", "/gesture/mouth/height");
  
  xPos= width/2;
  yPos = height/2;
}


void draw() {
  background(255);
  float x = poseOrientation.x;
  float y = poseOrientation.y;
  float z = poseOrientation.z; 
  
  int redValue = (int)map(mouthWidth, 8, 20, 0, 255);
  int blueValue = (int)map(mouthHeight, 0, 10, 0, 255);
  color Col = color(redValue,0,blueValue);

  fill(255,255,55);
  stroke(255, 0, 0);
  ellipse(width/2, height/2, mouthWidth * 5, mouthHeight *5 );

  
  if(mouthHeight > 3){
    println("drawing circles");
    circles.add(new Circle(width/2, height/2, -x*10, -y*10, Col, poseScale * 3));
    
  }
  
  for (int i = circles.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Circle circle = (Circle) circles.get(i);
    circle.moveCircle();
  }
  

}

private class Circle { 
  float xPos, yPos;
  float xAccel, yAccel, dia;
  color cirCol;
  Circle (float x, float y, float a, float b, color c, float d) {
    xPos = x;
    yPos = y;
    xAccel = a;
    yAccel = b;
    cirCol = c;
    dia = d;
  } 
  void moveCircle() { 

    //increment x and y to make the animation
    xPos=xPos+xAccel;
    yPos=yPos+yAccel;
  
    //draw new position
    fill(cirCol);
    noStroke();
    ellipse(xPos, yPos, dia, dia);
  }
}

public void gotMouthWidth( float mouthW ) {
  println("mouseWidth: " + mouthW);
  mouthWidth = mouthW;
}

public void gotMouthHeight( float mouthH ) {
  println("mouthHeight: " + mouthH);
  mouthHeight = mouthH;
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}


public void poseScale(float s) {
  println("scale: " + s);
  poseScale = s;
}