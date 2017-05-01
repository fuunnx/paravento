import java.util.List;
import java.util.Arrays;

ArrayList<Float[]> model (
  int nbMotors,
  float amplitude,
  float percOffsetBtCurves,
  float percOffsetBtMotors,
  float percAnimation
  )
{
  ArrayList<Float[]> motorPairs = new ArrayList<Float[]>();

  for (int i = 0; i < nbMotors; i += 1)
  {
    float motorAnimStep = percAnimation + i * percOffsetBtCurves;
    float angle1 = animationFunction(
      amplitude,
      motorAnimStep
    );
    float angle2 = animationFunction(
      amplitude,
      motorAnimStep + percOffsetBtMotors
    );
    motorPairs.add(new Float[]{angle1, angle2});
  }

  return motorPairs;
}

float animationFunction (float amplitude, float percAnimation)
{
  return sin(percAnimation / 100) * radians(amplitude);
}
