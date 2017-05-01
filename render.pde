int WHITE_COLOR = 255;
int BLACK_COLOR = 0;
int SCENE_X = 225;
int SCENE_Y = 100;
int SCENE_WIDTH = 775;
int SCENE_HEIGHT = 500;

void render(ArrayList<Float[]> motorPairs)
{
  background(BLACK_COLOR);
  pushMatrix();
  fill(WHITE_COLOR);
  rect(SCENE_X - 5, SCENE_Y - 5, 5, SCENE_HEIGHT + 10);
  rect(SCENE_X + SCENE_WIDTH, SCENE_Y - 5, 5, SCENE_HEIGHT + 10);
  noFill();
  popMatrix();

  int spaceBetweenCurves = 40;
  for (int i=0; i < motorPairs.size(); i+=1)
  {
    float motor1 = motorPairs.get(i)[0];
    float motor2 = motorPairs.get(i)[1];
    renderCurve(
      SCENE_X,
      SCENE_Y + i * spaceBetweenCurves,
      SCENE_WIDTH,
      motor1,
      motor2
    );

    renderCurve(
      SCENE_X,
      SCENE_Y + SCENE_HEIGHT,
      SCENE_WIDTH,
      motor1,
      motor2
    );
  }

  pushMatrix();
  strokeWeight(2);
  stroke(WHITE_COLOR);
  noFill();
  popMatrix();
}

void renderCurve(int x, int y, int curveWidth, float angle1, float angle2)
{
  float distance = curveWidth / 3;
  float c1x = cos((angle1)) * distance + x;
  float c1y = sin((angle1)) * distance + y;
  float c2x = cos(PI + (angle2)) * distance + x + curveWidth;
  float c2y = sin(PI + (angle2)) * distance + y;

  bezier(
    x, y,
    c1x, c1y,
    c2x, c2y,
    x + curveWidth, y
  );
}
