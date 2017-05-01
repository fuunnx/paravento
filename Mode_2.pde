void Mode2()
{
  float FREEDOM = 45;   
  int WHITE = 255;   
  int SCENE_X = 225;   
  int SCENE_Y = 100;   
  int SCENE_WIDTH = 775;   
  int SCENE_HEIGHT = 500;
  

  int motor1 = int(map(slider1, -FREEDOM, FREEDOM, 0, FREEDOM*2));
  int motor2 = int(map(slider2, -FREEDOM, FREEDOM, 0, FREEDOM*2));
  
  
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
  strokeWeight(4);
  stroke(WHITE);
  noFill();
  float distance = SCENE_WIDTH / 3;   
  float x1 = (cos(radians(slider1))) * distance + SCENE_X;
  float y1 = (sin(radians(slider1))) * distance + SCENE_Y;
  float x2 = cos(PI+radians(slider2)) * distance + SCENE_X + SCENE_WIDTH;
  float y2 = sin(PI+radians(slider2)) * distance + SCENE_Y;

  bezier(SCENE_X, SCENE_Y, x1, y1, x2, y2, SCENE_X + SCENE_WIDTH, SCENE_Y);
  popMatrix();
}