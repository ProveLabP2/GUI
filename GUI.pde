//Code written by Mihir Deshmukh
//It is a GUI used to transmit signals to control the testbed for PROVE Project 2
//The GUI is a screen with different buttons signalling the car to perform different functions:speed control, directional control, brake control

  import processing.serial.*;

  float boxX;
  float boxY;
  int boxSize = 400;       //Size is 1/4 of the screen because 4 buttons
  boolean mouseOverBox = false;
  
  //Box coordinates
  int forwardX = 400;
  int forwardY = 0;
  
  int backwardsX = 400;
  int backwardsY = 400;

  int turnRightX = 0;
  int turnRightY = 400;
  
  int turnLeftX = 0;
  int turnLeftY = 0;
  Serial port;

  void setup() {
    size(800, 800);
    boxX = width / 2.0;
    boxY = height / 2.0;

    // List all the available serial ports in the output pane.
    // You will need to choose the port that the Arduino board is connected to
    // from this list. The first port in the list is port #0 and the third port
    // in the list is port #2.
    // if using Processing 2.1 or later, use Serial.printArray()
    //println(Serial.list());

    // Open the port that the Arduino board is connected to (in this case #0)
    // Make sure to open the port at the same speed Arduino is using (9600bps)
    //port = new Serial(this, Serial.list()[0], 9600);
    
    // Draw the box for turn left
    drawBox(turnLeftX, turnLeftY, boxSize, boxSize, 255, 0, 0, "Turn Left"); //Red 
    
    // Draw the box for turn right
    drawBox(turnRightX, turnRightY, boxSize, boxSize, 0, 255, 0, "Turn Right"); //Green
    
    // Draw the box for move forward
    drawBox(forwardX, forwardY, boxSize, boxSize, 0, 0, 255, "Forward"); //Blue
    
    // Draw the box for move backwards
    drawBox(backwardsX, backwardsY, boxSize, boxSize, 255, 0, 255, "Backward");  //Purple
  }

  void draw() {
  //The following sections detects which button is pressed. The first if statement detects whether the mouse is pressed or not
  //then an if else block follows which checks which button it is
    if(mousePressed)
    {
        if(mouseX < forwardX && mouseY < turnRightY)
        {
          //port.write('L');                          //turns the car motor to the left
        }
        else if(mouseX < forwardX && mouseY > turnRightY)
        {
          //port.write('R');              //turns the car motor to the right            
        }
        else if(mouseX > forwardX && mouseY < backwardsY)
        {
          //port.write('F');                                     //moves the car forward               
        }
        else if(mouseX > backwardsX && mouseY > backwardsY)
        {
          //port.write('B');                                     //moves the car backwards          
        }
    }
    
  }


void drawBox(int xBoxLoc, int yBoxLoc, int boxDimX, int boxDimY, int colorR, int colorG, int colorB, String message)
{   
    fill(colorR, colorG, colorB);                            //Color of box
    rect(xBoxLoc, yBoxLoc, boxDimX, boxDimY);
    textSize(32);
    fill(0, 0, 0);                                          //Color of Text
    text(message, xBoxLoc + 130, yBoxLoc + 200);
  
}
