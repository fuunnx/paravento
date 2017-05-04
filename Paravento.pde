import controlP5.*;
import cc.arduino.*;
import processing.serial.*;

ControlP5 mainStage;



Arduino arduino;

float FREEDOM_MAX = 45;

public void settings() {
  size(1325, 700, "processing.opengl.PGraphics3D");
}

void setup()
{
  smooth();

  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(12, Arduino.SERVO);
  arduino.pinMode(11, Arduino.SERVO);
  arduino.pinMode(10, Arduino.SERVO);
  arduino.pinMode(9, Arduino.SERVO);
  
  arduino.servoWrite(12, 45);
  arduino.servoWrite(11, 45);
  arduino.servoWrite(10, 45);
  arduino.servoWrite(9, 45);
  
  mainStage = new ControlP5(this);

  mainStage.addKnob("motor1")
    .setLabel("Motor 1 angle")
    .setRange(-45, 45)
    .setValue(0)
    .setPosition(100, 70)
    .setRadius(40)
    .setDragDirection(Knob.HORIZONTAL)
    .setNumberOfTickMarks(30)
    .snapToTickMarks(true)
  ;

  mainStage.addKnob("motor2")
    .setLabel("Motor 2 angle")
    .setRange(-45, 45)
    .setValue(0)
    .setPosition(1050, 70)
    .setRadius(40)
    .setDragDirection(Knob.HORIZONTAL)
    .setNumberOfTickMarks(30)
    .snapToTickMarks(true)
  ;

  mainStage.addSlider("mode")
    .setLabel("View mode")
    .setPosition(10, 10)
    .setRange(1, 4)
    .setValue(1)
    .setNumberOfTickMarks(4)
    .snapToTickMarks(true)
    .showTickMarks(false)
  ;

  mainStage.addSlider("duration")
    .setLabel("Animation duration")
    .setPosition(400, 10)
    .setRange(1, 5000)
    .setValue(3000)
  ;

  mainStage.addSlider("perc_offset_bt_motors")
    .setLabel("% animation offset between motors")
    .setPosition(400, 20)
    .setRange(1, 100)
    .setValue(50)
  ;

  mainStage.addSlider("perc_offset_bt_lines")
    .setLabel("% animation offset between lines")
    .setPosition(400, 30)
    .setRange(1, 100)
    .setValue(50)
  ;

  mainStage.addSlider("amplitude")
    .setLabel("Animation amplitude")
    .setPosition(400, 40)
    .setRange(0, FREEDOM_MAX)
    .setValue(45)
  ;
}

void draw()
{
  ArrayList<Float[]> motorPairs = new ArrayList<Float[]>();

  if (mainStage.get("mode").getValue() == 1)
  {
    int nbMotors = 7;
    float amplitude = mainStage.get("amplitude").getValue();
    float offsetBtLines = mainStage.get("perc_offset_bt_lines").getValue();
    float offsetBtMotors = mainStage.get("perc_offset_bt_motors").getValue();
    float percAnimation = millis() * 100 / mainStage.get("duration").getValue();

    motorPairs = model(
      nbMotors,
      amplitude,
      offsetBtLines,
      offsetBtMotors,
      percAnimation
    );

  } else {

    motorPairs.add(new Float[]{
      radians(mainStage.get("motor1").getValue()),
      radians(mainStage.get("motor2").getValue())
    });

  }

  render(motorPairs);
  controlArduino(motorPairs);
}