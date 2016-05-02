int value = 0;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

void setup() {
 size(1940, 990);
 background(255);
 //fill(0);
 stroke(0);
 ellipse(350, 250, 250, 250);
 minim = new Minim(this);
 out = minim.getLineOut();
 out.setTempo( 80 );
 out.pauseNotes();
 
 //out.playNote( 4.0, 0.9, "G3" );
 out.resumeNotes();
}

void draw(){
  
}

void keyPressed(){
  if(key == 'w'){
    background(255);
    fill(255, 0, 0);
    ellipse(350, 250, 250, 250);
    out.playNote( 0.1, 1.5, "B" );
  }
  if(key == 's'){
    background(255);
    fill(0, 255, 0);
    ellipse(780, 820, 250, 250);
    out.playNote( 0.1, 1.5, "C" );    
  }
  if(key == 'g'){
    background(255);
    fill(0, 0, 255);
    ellipse(1230, 820, 250, 250);
    out.playNote( 0.1, 1.5, "G" );    
  }
  if (key == ' '){
    background(255);
    fill(100, 30, 10);
    ellipse(350, 820, 250, 250);
    out.playNote( 0.1, 1.5, "A" );    
  }
  if (key == 'a'){
    background(255);
    fill(150, 75, 110);
    ellipse(780, 250, 250, 250);
    out.playNote( 0.1, 1.5, "E" );    
  }
  if (key == 'f'){
    background(255);
    fill(200, 130, 10);
    ellipse(1230, 250, 250, 250);
    out.playNote( 0.1, 1.5, "F" );    
  }
}

void keyReleased(){
  background(255);
}