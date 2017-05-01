void Mode1()
{
  
  //FirstPhase
  pushMatrix();

  fill(255);
  rect(200,50,25,500);
  rect(1000,50,25,500);
  stroke(255);
  noFill();
  int motor1 = int(map(slider1, -45,45,0,90));
  int motor2 = int(map(slider2, -45,45,0,90));
  println(motor1,motor2);
  
  //arduino.servoWrite(12, motor1);
  //arduino.servoWrite(11, motor2);
  popMatrix();
  
  
  // Second Phase
  pushMatrix(); 
    translate(225,100);
    rotate(radians(slider1)); 
    strokeWeight(4); 
    line(-25, 0, 25, 0); 
  popMatrix();
  
  pushMatrix(); 
    translate(1000,100);
    rotate(radians(slider2)); 
    strokeWeight(4); 
    line(-25, 0, 25, 0); 
  popMatrix();
  
  noFill();
  stroke(255, 102, 0);
  // line(30, 20, 80, 5);
  // line(80, 75, 30, 75);
  stroke(255);
  
}