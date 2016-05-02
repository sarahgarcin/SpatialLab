import oscP5.*;
OscP5 oscP5;

PVector poseOrientation = new PVector();
float poseScale;


void setup() { 
  size(640, 480, P3D); 

  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
} 

void draw() { 
  background(127);

  pushMatrix(); 
  translate(width/2, height/2, -20); 

  float x = poseOrientation.x;
  float y = poseOrientation.y;
  float z = poseOrientation.z;  

  rotateX(-x);
  rotateY(-y);
  rotateZ(z);

  scale(poseScale);

  noFill();
  stroke(255);
  box(40, 50, 40);

  popMatrix();
} 


public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}


public void poseScale(float s) {
  println("scale: " + s);
  poseScale = s;
}