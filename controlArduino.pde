void controlArduino(ArrayList<Float[]> motorPairs)
{
  //for (int i=0; i < motorPairs.size(); i+=1)
  //{
    
    
    int  motor1 = int(map(degrees(motorPairs.get(0)[0]),-FREEDOM_MAX,+FREEDOM_MAX,0,FREEDOM_MAX*2));
    int  motor2 = int(map(degrees(motorPairs.get(0)[1]),-FREEDOM_MAX,+FREEDOM_MAX,0,FREEDOM_MAX*2));
    int  motor3 = int(map(degrees(motorPairs.get(1)[0]),-FREEDOM_MAX,+FREEDOM_MAX,0,FREEDOM_MAX*2));
    int  motor4 = int(map(degrees(motorPairs.get(1)[1]),-FREEDOM_MAX,+FREEDOM_MAX,0,FREEDOM_MAX*2));

    arduino.servoWrite(12, motor1);
    arduino.servoWrite(11, motor2);
    arduino.servoWrite(10, motor3);
    arduino.servoWrite(9, motor4);
    
 //}
}