void Mode3()
{
  
  int WHITE = 255;   
  int SCENE_X = 225;   
  int SCENE_Y = 100;   
  int SCENE_WIDTH = 775;   
  int SCENE_HEIGHT = 500;
  int DURATION = Duration;
  int time = millis();
  
  
  
  
  int motor1 = int(map(slider1, -FREEDOM_MAX, FREEDOM_MAX, 0, FREEDOM_MAX*2));
  int motor2 = int(map(slider2, -FREEDOM_MAX, FREEDOM_MAX, 0, FREEDOM_MAX*2));
  
  
  //arduino.servoWrite(12, motor1);
  //arduino.servoWrite(11, motor2);

  
  
  //DRAW SCENE RECTS
  pushMatrix();
  fill(WHITE);
  rect(SCENE_X - 5, SCENE_Y - 5, 5, SCENE_HEIGHT + 10);
  rect(SCENE_X + SCENE_WIDTH, SCENE_Y - 5, 5, SCENE_HEIGHT + 10);
  noFill();
  popMatrix();

  // draw line 1
  pushMatrix();
  strokeWeight(2);
  stroke(WHITE);
  noFill();
  
  
  float step= (time*100/DURATION);
  float distance = SCENE_WIDTH / 3;   

  for(int i=0;i<7;i=i+1)
  {
  
  float offset=i*offset_lines;
  float angle1= sin((step + offset)/ 100)*radians(Amplitude);
  float angle2 = sin((step + offset_motor + offset)/100)*radians(Amplitude);
  
  
  float x1 = (cos((angle1))) * distance + SCENE_X;
  float y1 = (sin((angle1))) * distance + SCENE_Y+i*40;
  float x2 = cos(PI+(angle2)) * distance + SCENE_X + SCENE_WIDTH;
  float y2 = sin(PI+(angle2)) * distance + SCENE_Y+i*40;
  
  bezier(
    SCENE_X, SCENE_Y+i*40,
    x1, y1,
    x2, y2,
    SCENE_X + SCENE_WIDTH, SCENE_Y+i*40
  );

    
  float tx1 = (cos((angle1))) * distance + SCENE_X;
  float ty1 = (sin((angle1))) * distance + SCENE_Y + SCENE_HEIGHT;
  float tx2 = cos(PI+(angle2)) * distance + SCENE_X + SCENE_WIDTH;
  float ty2 = sin(PI+(angle2)) * distance + SCENE_Y + SCENE_HEIGHT;
  
  bezier(
    SCENE_X, SCENE_Y + SCENE_HEIGHT,
    tx1, ty1,
    tx2, ty2,
    SCENE_X + SCENE_WIDTH, SCENE_Y + SCENE_HEIGHT
  );
  }
  popMatrix();
  
}