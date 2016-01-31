
/* Receives osc data from FaceOSC and uses mouth parameters
 to change background color*/

import oscP5.*;
import netP5.*;

// make osc object
OscP5 oscP5;

// variables that store received mouth width and height
float mouthWidth = 0;
float mouthHeight = 0;

void setup() {

  size(400, 400);

  // note: port needs to match FaceOSC port
  oscP5 = new OscP5(this, 8338);

  // set up the function that will process the incoming data
  // with the osc address "/gesture/mouth/width"
  oscP5.plug(this, "gotMouthWidth", "/gesture/mouth/width");

  // same for height
  oscP5.plug(this, "gotMouthHeight", "/gesture/mouth/height");
}


void draw() {
  // map the raw values from one range to another
  // test to see what your min and max values
  // here width was 8-10 and height 0-10
  int redValue = (int)map(mouthWidth, 8, 20, 0, 255);
  int blueValue = (int)map(mouthHeight, 0, 10, 0, 255);

  // set background color
  background(redValue, 0, blueValue);
}

public void gotMouthWidth( float mouthW ) {
  println("mouthWidth: " + mouthWidth);
  mouthWidth = mouthW;
}

public void gotMouthHeight( float mouthH ) {
  println("mouthHeight: " + mouthH);
  mouthHeight = mouthH;
}