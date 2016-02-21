import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect; 
PImage img;

void setup(){
  size(640, 480, OPENGL);
  kinect = new Kinect(this);
  kinect.initDepth();

}

void draw(){
  
  background(0);
  //store kinect image into variable
  img = kinect.getDepthImage();
  // Draw that image on the screen
  //image(img, 0, 0);
  int skip = 10;
  // Go throught each pixels
  for(int x= 0; x < kinect.width; x +=skip){
    for(int y=0; y < kinect.height; y +=skip){
      int index = x + y * kinect.width;
      float b = brightness(img.pixels[index]);
      float z = map(b, 0, 255, 150, -150);
      fill(255);
      pushMatrix();
      translate(x,y,z);
      rect(0, 0, skip/2, skip/2);
      popMatrix();
    }
  }
}