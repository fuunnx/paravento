import controlP5.*;
import cc.arduino.*;  
import processing.serial.*;

ControlP5 main;
ControlP5 cp1;
ControlP5 cp2;
ControlP5 cp3;
ControlP5 cp4;
ControlP5 cp5;




Arduino arduino;


int knobValue = 100;
int Duration=3000;
Knob myKnobA;
Knob myKnobB;

float slider1 = 0;
float slider2 = 0;
float angle = 0;
int offset_motor = 50;
int offset_lines = 50;
int Mode=3;
int Amplitude=45;
float FREEDOM_MAX = 45; 
  
void setup()
{
  
 size(1325,700,P3D);
 
 //arduino = new Arduino(this, Arduino.list()[0], 57600);

// arduino.pinMode(12, Arduino.SERVO);
// arduino.pinMode(11, Arduino.SERVO);
 
// arduino.servoWrite(12, 45);
// arduino.servoWrite(11, 45); 
  
 smooth();
 cp1 = new ControlP5(this);
 cp2 = new ControlP5(this);
 main = new ControlP5(this);

 myKnobA = cp1.addKnob("slider1")
               .setRange(-45,45)
               .setValue(0)
               .setPosition(100,70)
               .setRadius(40)
               .setDragDirection(Knob.HORIZONTAL)
               .setNumberOfTickMarks(30)
               .snapToTickMarks(true);
               ;
 myKnobB = cp1.addKnob("slider2")
               .setRange(-45,45)
               .setValue(0)
               .setPosition(1050,70)
               .setRadius(40)
               .setDragDirection(Knob.HORIZONTAL)
               .setNumberOfTickMarks(30)
               .snapToTickMarks(true)
               ;
               
 main.addSlider("Mode")
     .setPosition(10,10)
     .setRange(1,4)
     .setNumberOfTickMarks(4)
     .snapToTickMarks(true)
     .showTickMarks(false)
     ;
     
 cp2.addSlider("Duration")
     .setPosition(400,10)
     .setRange(1,5000)
     .setValue(3000)
     ;
     
     
 cp2.addSlider("offset_motor")
     .setPosition(400,20)
     .setRange(1,100)
     .setValue(3000)
     ;
     
  cp2.addSlider("offset_lines")
     .setPosition(400,30)
     .setRange(1,100)
     .setValue(3000)
     ;
     
  cp2.addSlider("Amplitude")
     .setPosition(400,40)
     .setRange(0,FREEDOM_MAX)
     .setValue(3000)
     ;

 
}


void draw()
{
  background(0);   
  
  if(Mode == 1)
  {
    cp1.show();
    Mode1();
  }
  
  else if(Mode == 2)
  {
    Mode2();
  }
  
  else if(Mode == 3)
  {
    Mode3();
  }

  
  
    
}