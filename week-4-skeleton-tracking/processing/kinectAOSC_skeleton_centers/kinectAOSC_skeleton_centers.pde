/**
 Receives osc data from kinectA openFrameworks app
 Uses oscP5 
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;

ArrayList<SkeletonCenter>skelCenters = new ArrayList();

void setup() {

  size(640, 480, P3D);
  oscP5 = new OscP5(this, 3333);
  oscP5.plug(this, "receivedSkeletons", "/skeletons/ID-centralXYZ");
}

void draw() {
  background(0);

  for (int i = 0; i < skelCenters.size (); i++) {
    skelCenters.get(i).update();
    skelCenters.get(i).draw();
  }

  for (int i = skelCenters.size ()-1; i >=0; i--) {
    if (skelCenters.get(i).markForDead) {
      skelCenters.remove(i);
    }
  }
}

public void receivedSkeletons(int id, float x, float y, float z) {

  x *= width;
  y *= height;

  boolean bAlreadyTracking = false;
  for (int i = 0; i < skelCenters.size (); i++) {
    if (skelCenters.get(i).id == id ) {
      skelCenters.get(i).setPosition(x, y, z);
      bAlreadyTracking = true;
      break;
    }
  }

  if (!bAlreadyTracking) {
    skelCenters.add(new SkeletonCenter(id, x, y, z) );
  }
}

class SkeletonCenter {

  float lastTimeFound = 0;
  int id;
  boolean markForDead = false;
  float x = 0;
  float y = 0;
  float z = 0;

  SkeletonCenter(int _id, float _x, float _y, float _z) {
    id = _id;
    setPosition(_x, _y, _z);
  }

  void update() {
    if (millis()-lastTimeFound > 100) {
      markForDead = true;
    }
  }

  void setPosition(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    lastTimeFound = millis();
  }

  void draw() {
    fill(255);
    ellipse(x, y, 30, 30);
    fill(255, 0, 0);
    text(id, x, y);
  }
}