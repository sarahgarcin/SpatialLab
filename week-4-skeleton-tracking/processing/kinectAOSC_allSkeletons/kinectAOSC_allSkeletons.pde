/**
 Receives osc data from kinectA openFrameworks app
 Uses oscP5 
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
ArrayList<Skeleton>skeletons;
int lastSkelID = 0;
float scaleX = 1;
float scaleY = 1;

void setup() {

  size(640, 480, P3D);
  scaleX = width; // scale up because values come in range 0 to 1
  scaleY = height; // scale up because values come in range 0 to 1

  skeletons = new ArrayList();

  oscP5 = new OscP5(this, 3333);
  oscP5.plug(this, "receivedSkeletons", "/skeletons/ID-centralXYZ");
  oscP5.plug(this, "receivedNeckShoulder", "/skeletons/bones/neckShoulder");
  oscP5.plug(this, "receivedLeftArm", "/skeletons/bones/leftArm");
  oscP5.plug(this, "receivedRightArm", "/skeletons/bones/rightArm");
  oscP5.plug(this, "receivedLeftLeg", "/skeletons/bones/leftLeg");
  oscP5.plug(this, "receivedRightLeg", "/skeletons/bones/rightLeg");
}

void draw() {
  background(0);

  for (int i = 0; i < skeletons.size (); i++) {
    skeletons.get(i).update();
    skeletons.get(i).draw();
  }

  for (int i = skeletons.size ()-1; i >=0; i--) {
    if (skeletons.get(i).markForDead) {
      skeletons.remove(i);
    }
  }
}


public void receivedSkeletons(int id, float x, float y, float z) {

  boolean bAlreadyTracking = false;
  for (int i = 0; i < skeletons.size (); i++) {
    if (skeletons.get(i).id == id ) {
      // set center
      skeletons.get(i).setPosition(x, y, z);
      lastSkelID = id;
      bAlreadyTracking = true;
      break;
    }
  }

  if (!bAlreadyTracking) {
    skeletons.add(new Skeleton(id) );
  }
}

public void receivedNeckShoulder(
float nAx, float nAy, 
float nBx, float nBy, 
float rAX, float rAY, 
float rBX, float rBY, 
float lAX, float lAY, 
float lBX, float lBY) {

  for (int i = 0; i < skeletons.size (); i++) {
    Skeleton skel = skeletons.get(i);
    if (skel.id == lastSkelID ) {
      skel.neckShoulder.neckA.set(nAx, nAy, 0);
      skel.neckShoulder.neckB.set(nBx, nBy, 0);
      skel.neckShoulder.rightShoulderA.set(rAX, rAY, 0);
      skel.neckShoulder.rightShoulderB.set(rBX, rBY, 0);
      skel.neckShoulder.leftShoulderA.set(lAX, lAY, 0);
      skel.neckShoulder.leftShoulderB.set(lBX, lBY, 0);
      break;
    }
  }
}

public void receivedLeftArm( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {

  for (int i = 0; i < skeletons.size (); i++) {
    Skeleton skel = skeletons.get(i);
    if (skel.id == lastSkelID ) {
      skel.leftArm.upperA.set(uAX, uAY, 0);
      skel.leftArm.upperB.set(uBX, uBY, 0);
      skel.leftArm.lowerA.set(lAX, lAY, 0);
      skel.leftArm.lowerB.set(lBX, lBY, 0);
      break;
    }
  }
}

public void receivedRightArm( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {

  for (int i = 0; i < skeletons.size (); i++) {
    Skeleton skel = skeletons.get(i);
    if (skel.id == lastSkelID ) {
      skel.rightArm.upperA.set(uAX, uAY, 0);
      skel.rightArm.upperB.set(uBX, uBY, 0);
      skel.rightArm.lowerA.set(lAX, lAY, 0);
      skel.rightArm.lowerB.set(lBX, lBY, 0);
      break;
    }
  }
}

public void receivedLeftLeg( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {
  for (int i = 0; i < skeletons.size (); i++) {
    Skeleton skel = skeletons.get(i);
    if (skel.id == lastSkelID ) {
      skel.leftLeg.upperA.set(uAX, uAY, 0);
      skel.leftLeg.upperB.set(uBX, uBY, 0);
      skel.leftLeg.lowerA.set(lAX, lAY, 0);
      skel.leftLeg.lowerB.set(lBX, lBY, 0);
      break;
    }
  }
}
public void receivedRightLeg( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {
  for (int i = 0; i < skeletons.size (); i++) {
    Skeleton skel = skeletons.get(i);
    if (skel.id == lastSkelID ) {
      skel.rightLeg.upperA.set(uAX, uAY, 0);
      skel.rightLeg.upperB.set(uBX, uBY, 0);
      skel.rightLeg.lowerA.set(lAX, lAY, 0);
      skel.rightLeg.lowerB.set(lBX, lBY, 0);
      break;
    }
  }
}