/**
 Receives osc data from kinectA openFrameworks app
 Only for singe skeleton tracking.
 Uses oscP5 
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;

NeckShoulder neckShoulder;
Limb leftArm;
Limb rightArm;
Limb leftLeg;
Limb rightLeg;
float scale = 1;

void setup() {

  size(500, 500, P3D);
  scale = width; // scale up because values come in range 0 to 1
  
  neckShoulder = new NeckShoulder();
  rightArm = new Limb();
  leftArm = new Limb();
  rightLeg = new Limb();
  leftLeg = new Limb();

  oscP5 = new OscP5(this, 3333);
  oscP5.plug(this, "receivedNeckShoulder", "/skeletons/bones/neckShoulder");
  oscP5.plug(this, "receivedLeftArm", "/skeletons/bones/leftArm");
  oscP5.plug(this, "receivedRightArm", "/skeletons/bones/rightArm");
  oscP5.plug(this, "receivedLeftLeg", "/skeletons/bones/leftLeg");
  oscP5.plug(this, "receivedRightLeg", "/skeletons/bones/rightLeg");
}

void draw() {
  background(0);
  neckShoulder.draw();
  leftArm.draw();
  rightArm.draw();
  leftLeg.draw();
  rightLeg.draw();
  
  // connect legs
 line(leftLeg.upperA.x*scale, leftLeg.upperA.y*scale,rightLeg.upperA.x*scale, rightLeg.upperA.y*scale);

// connect shoulder to legs
float centerHipX = ((leftLeg.upperA.x*scale)+(rightLeg.upperA.x*scale))*.5;
float centerHipY = ((leftLeg.upperA.y*scale)+(rightLeg.upperA.y*scale))*.5;
line(centerHipX,centerHipY,neckShoulder.neckB.x*scale,neckShoulder.neckB.y*scale);

}

public void receivedNeckShoulder(
float nAx, float nAy, 
float nBx, float nBy, 
float rAX, float rAY, 
float rBX, float rBY, 
float lAX, float lAY, 
float lBX, float lBY) {

  neckShoulder.neckA.set(nAx, nAy, 0);
  neckShoulder.neckB.set(nBx, nBy, 0);
  neckShoulder.rightShoulderA.set(rAX, rAY, 0);
  neckShoulder.rightShoulderB.set(rBX, rBY, 0);
  neckShoulder.leftShoulderA.set(lAX, lAY, 0);
  neckShoulder.leftShoulderB.set(lBX, lBY, 0);
}

public void receivedLeftArm( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {

  leftArm.upperA.set(uAX, uAY, 0);
  leftArm.upperB.set(uBX, uBY, 0);
  leftArm.lowerA.set(lAX, lAY, 0);
  leftArm.lowerB.set(lBX, lBY, 0);
}

public void receivedRightArm( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {

  rightArm.upperA.set(uAX, uAY, 0);
  rightArm.upperB.set(uBX, uBY, 0);
  rightArm.lowerA.set(lAX, lAY, 0);
  rightArm.lowerB.set(lBX, lBY, 0);
}

public void receivedLeftLeg( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {
  leftLeg.upperA.set(uAX, uAY, 0);
  leftLeg.upperB.set(uBX, uBY, 0);
  leftLeg.lowerA.set(lAX, lAY, 0);
  leftLeg.lowerB.set(lBX, lBY, 0);
}
public void receivedRightLeg( float uAX, float uAY, float uBX, float uBY, float lAX, float lAY, float lBX, float lBY) {
  rightLeg.upperA.set(uAX, uAY, 0);
  rightLeg.upperB.set(uBX, uBY, 0);
  rightLeg.lowerA.set(lAX, lAY, 0);
  rightLeg.lowerB.set(lBX, lBY, 0);
}

// classes
class NeckShoulder {

  PVector neckA, neckB;
  PVector rightShoulderA;
  PVector rightShoulderB;
  PVector leftShoulderA;
  PVector leftShoulderB;

  NeckShoulder() {
    neckA = new PVector(0, 0, 0);
    neckB = new PVector(0, 0, 0);
    rightShoulderA= new PVector(0, 0, 0);
    rightShoulderB= new PVector(0, 0, 0);
    leftShoulderA= new PVector(0, 0, 0);
    leftShoulderB= new PVector(0, 0, 0);
  }

  void draw() {
    fill(255);
    ellipse(neckA.x*scale, neckA.y*scale, 10, 10);
    ellipse(neckB.x*scale, neckB.y*scale, 10, 10);

    ellipse(rightShoulderA.x*scale, rightShoulderA.y*scale, 10, 10);
    ellipse(rightShoulderB.x*scale, rightShoulderB.y*scale, 10, 10);
    ellipse(leftShoulderA.x*scale, leftShoulderA.y*scale, 10, 10);
    ellipse(leftShoulderB.x*scale, leftShoulderB.y*scale, 10, 10);
    
    stroke(255);
    line(neckA.x*scale, neckA.y*scale,neckB.x*scale, neckB.y*scale);
    line(rightShoulderA.x*scale, rightShoulderA.y*scale,rightShoulderB.x*scale, rightShoulderB.y*scale);
    line(leftShoulderA.x*scale, leftShoulderA.y*scale,leftShoulderB.x*scale, leftShoulderB.y*scale);
  }
}


class Limb {
  PVector upperA, upperB, lowerA, lowerB;

  Limb() {
    upperA = new PVector(0, 0, 0);
    upperB = new PVector(0, 0, 0);
    lowerA = new PVector(0, 0, 0);
    lowerB = new PVector(0, 0, 0);
  }

  void draw() {
    fill(255);
    ellipse(upperA.x*scale, upperA.y*scale, 10, 10);
    ellipse(upperB.x*scale, upperB.y*scale, 10, 10);
    ellipse(lowerA.x*scale, lowerA.y*scale, 10, 10);
    ellipse(lowerB.x*scale, lowerB.y*scale, 10, 10);
    stroke(255);
    line(upperA.x*scale, upperA.y*scale, upperB.x*scale, upperB.y*scale);
    line(lowerA.x*scale, lowerA.y*scale, lowerB.x*scale, lowerB.y*scale);
  }
}