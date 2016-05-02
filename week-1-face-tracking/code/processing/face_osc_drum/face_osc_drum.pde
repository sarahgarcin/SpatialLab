import processing.opengl.*;

//import minim library
import ddf.minim.*;
import ddf.minim.ugens.*;

// Import osc library
import oscP5.*;
OscP5 oscP5;

//Create minim object and audioOutput
Minim       minim;
AudioOutput out;

// Create your sampler object
Sampler     kick;
Sampler     snare;
Sampler     hat;

// gesture
float mouthHeight;
float eyeRight;
float eyebrowLeft;

void setup()
{
  size(395, 200);
  frameRate(5);
  // Declare the minim object
  minim = new Minim(this);
  out   = minim.getLineOut();
  
  // load all of our samples, using 4 voices for each.
  // this will help ensure we have enough voices to handle even
  // very fast tempos.
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );
  
  // patch samplers to the output
  kick.patch( out );
  snare.patch( out );
  hat.patch( out );

  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");

}

void draw()
{
  background(0);
  fill(255);
  if(mouthHeight > 3){
    hat.trigger();
  }
  if(eyeRight < 2.5){
    snare.trigger();
  }
  if(eyebrowLeft < 7){
     kick.trigger();
  }
 
}

public void mouthHeightReceived(float h) {
  println("mouth height: " + h);
  mouthHeight = h;
}

public void eyeRightReceived(float f) {
  println("eye right: " + f);
  eyeRight = f;
}

public void eyebrowLeftReceived(float f) {
  println("eyebrow left: " + f);
  eyebrowLeft = f;
}