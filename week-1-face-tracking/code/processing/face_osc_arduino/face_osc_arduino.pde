import processing.serial.*;
import cc.arduino.*;
import oscP5.*;
OscP5 oscP5;

Arduino arduino;
int ledPin = 13;

float mouthHeight;

void setup()
{
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "gotMouthHeight", "/gesture/mouth/height");
}

void draw()
{
  if(mouthHeight > 3){
    arduino.digitalWrite(ledPin, Arduino.HIGH);
  }
  else{
    arduino.digitalWrite(ledPin, Arduino.LOW);
  }
}

public void gotMouthHeight( float mouseH ) {
  println("mouthHeight: " + mouthHeight);
  mouthHeight = mouseH;
}