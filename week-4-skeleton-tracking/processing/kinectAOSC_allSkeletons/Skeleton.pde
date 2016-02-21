class Skeleton {

  int id;
  float lastTimeFound = 0;
  boolean markForDead = false;
  PVector center;
  NeckShoulder neckShoulder;
  Limb leftArm;
  Limb rightArm;
  Limb leftLeg;
  Limb rightLeg;

  Skeleton(int _id) {
    id = _id;
    neckShoulder = new NeckShoulder();
    rightArm = new Limb();
    leftArm = new Limb();
    rightLeg = new Limb();
    leftLeg = new Limb();
    center = new PVector(0,0,0);
  }

  void draw() {
    neckShoulder.draw();
    leftArm.draw();
    rightArm.draw();
    leftLeg.draw();
    rightLeg.draw();

    // connect legs
    line(leftLeg.upperA.x*scaleX, leftLeg.upperA.y*scaleY, rightLeg.upperA.x*scaleX, rightLeg.upperA.y*scaleY);

    // connect shoulder to legs
    float centerHipX = ((leftLeg.upperA.x*scaleX)+(rightLeg.upperA.x*scaleX))*.5;
    float centerHipY = ((leftLeg.upperA.y*scaleY)+(rightLeg.upperA.y*scaleY))*.5;
    line(centerHipX, centerHipY, neckShoulder.neckB.x*scaleX, neckShoulder.neckB.y*scaleY);
    
    // number
    fill(255,0,0);
    text(id, neckShoulder.neckA.x*scaleX - 5,neckShoulder.neckA.y*scaleY-10);
  }
  
    void update() {
    if (millis()-lastTimeFound > 100) {
      markForDead = true;
    }
  }

  void setPosition(float _x, float _y, float _z) {
    center.set(_x,_y,_z);
    lastTimeFound = millis();
  }
}



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
    ellipse(neckA.x*scaleX, neckA.y*scaleY, 10, 10);
    ellipse(neckB.x*scaleX, neckB.y*scaleY, 10, 10);

    ellipse(rightShoulderA.x*scaleX, rightShoulderA.y*scaleY, 10, 10);
    ellipse(rightShoulderB.x*scaleX, rightShoulderB.y*scaleY, 10, 10);
    ellipse(leftShoulderA.x*scaleX, leftShoulderA.y*scaleY, 10, 10);
    ellipse(leftShoulderB.x*scaleX, leftShoulderB.y*scaleY, 10, 10);

    stroke(255);
    line(neckA.x*scaleX, neckA.y*scaleY, neckB.x*scaleX, neckB.y*scaleY);
    line(rightShoulderA.x*scaleX, rightShoulderA.y*scaleY, rightShoulderB.x*scaleX, rightShoulderB.y*scaleY);
    line(leftShoulderA.x*scaleX, leftShoulderA.y*scaleY, leftShoulderB.x*scaleX, leftShoulderB.y*scaleY);
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
    ellipse(upperA.x*scaleX, upperA.y*scaleY, 10, 10);
    ellipse(upperB.x*scaleX, upperB.y*scaleY, 10, 10);
    ellipse(lowerA.x*scaleX, lowerA.y*scaleY, 10, 10);
    ellipse(lowerB.x*scaleX, lowerB.y*scaleY, 10, 10);
    stroke(255);
    line(upperA.x*scaleX, upperA.y*scaleY, upperB.x*scaleX, upperB.y*scaleY);
    line(lowerA.x*scaleX, lowerA.y*scaleY, lowerB.x*scaleX, lowerB.y*scaleY);
  }
}

