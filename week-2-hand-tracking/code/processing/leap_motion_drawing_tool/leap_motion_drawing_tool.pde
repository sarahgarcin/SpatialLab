import de.voidplus.leapmotion.*;
LeapMotion leap;
ArrayList<PVector> points; 
PVector fp;
Finger fi;

void setup(){
    size(800, 600, P3D);
    background(255);
    noStroke();

    leap = new LeapMotion(this).withGestures();
    points = new ArrayList<PVector>(); 
}

void draw(){
  background(255);
  int fps = leap.getFrameRate();
  frameRate(fps);
  for (Hand hand : leap.getHands()) {
     Finger  finger_index     = hand.getIndexFinger();
     fp = finger_index.getPosition();

      if (fp.z <= 30) {
       fill(0);
       ellipse(fp.x, fp.y, constrain(fp.z, 5, 10), constrain(fp.z, 5, 10));
      }
      else if (fp.z > 30) {
       points.add(new PVector(fp.x, fp.y));
      }
   }

  for (int i = points.size()-1; i >= 0; i--) {
   PVector p = points.get(i);
   fill(23, 77, 255);
   ellipse(p.x, p.y, 20, 20);
  }
}
 
void keyPressed() {
  if (key == 32) {
    points = new ArrayList<PVector>();
  }
}
void leapOnCircleGesture(CircleGesture g, int state){
  int     id               = g.getId();

  switch(state){
    case 1:  // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("CircleGesture: "+id);
      points = new ArrayList<PVector>();
      break;
  }
  
}

   