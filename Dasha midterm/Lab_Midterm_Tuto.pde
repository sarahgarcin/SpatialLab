int test = 0;
int next = 0;
int ok = 0;
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
 
 //rectMode(CENTER);
}

void draw() {

  switch(next){
    case 1:
      stroke(0);
      fill(255);
      ellipse(780, 820, 250, 250);
      break;
    
    case 2:
      stroke(0);
      fill(255);
      ellipse(1230, 820, 250, 250);
      break;
    
    case 3:
      stroke(0);
      fill(255);
      ellipse(350, 820, 250, 250);
      break;
    
    case 4:
      stroke(0);
      fill(255);
      ellipse(780, 250, 250, 250);
      break;
      
    case 5:
      stroke(0);
      fill(255);
      ellipse(1230, 250, 250, 250);
      break;

    //case 6:
    //  stroke(0);
    //  fill(255);
    //  ellipse(200, 125, 50, 50);
    //  break;
      
    case 6:
      fill(0);
      textSize(30);
      text("THE END", 660, 450);
      break;
  }
}

void keyPressed(){
  
switch(key){
  
        case 'w':
        if(test == 0){
          println("w");
          background(255);
          fill(255, 0, 0);
          ellipse(350, 250, 250, 250);
          out.playNote( 0.1, 1.5, "B" );
          ok = 1;
        }
        else{
          println("error");
          stroke(0);
          drawError();
          ok = 0;
        }
        break;
  
      
      case 's' :
        if(test == 1){
          println("a");
          background(255);
          fill(0, 255, 0);
          ellipse(780, 820, 250, 250);
          out.playNote( 0.1, 1.5, "C" );
          ok = 1;
        }
        else{
          println("error");
          drawError();
          ok = 0;
        }
        break;
        
        
      case 'g':
        if(test == 2){
          println("space");
          background(255);
          fill(0, 0, 255);
          ellipse(1230, 820, 250, 250);
          out.playNote( 0.1, 1.5, "G" );
          ok = 1;
        }
        else{
          println("error");
          drawError();
          ok = 0;
        }
        break;
      
      case ' ': 
        if(test == 3){
          println("space");
          background(255);
          fill(100, 30, 10);
          ellipse(350, 820, 250, 250);
          out.playNote( 0.1, 1.5, "A" );
          ok = 1;
        }
        else{
          println("error");
          drawError();
          ok = 0;
        }
        break;
        
        case 'a': 
        if(test == 4){
          println("s");
          background(255);
          fill(150, 75, 110);
          ellipse(780, 250, 250, 250);
          out.playNote( 0.1, 1.5, "E" );
          ok = 1;
        }
        else{
          println("error");
          drawError();
          ok = 0;
        }
        break;
        
        case 'f': 
        if(test == 5){
          println("f");
          background(255);
          fill(200, 130, 10);
          ellipse(1230, 250, 250, 250);
          out.playNote( 0.1, 1.5, "F" );
          ok = 1;
        }
        else{
          println("error");
          drawError();
          ok = 0;
        }
        break;
    }
}

void keyReleased(){
  background(255);
    if(ok == 1){
    test ++;
    next ++;
  }
}

void drawError(){
  stroke(0);
  line(0, 0, width, height);
  line(0, height, width, 0);
}