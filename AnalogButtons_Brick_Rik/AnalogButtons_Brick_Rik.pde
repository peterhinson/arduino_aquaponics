/*
  AnalogButtons,
  
  created 02 Jan 2009 V 0.1
 
 Connect more than one button to a single analog pin, 
 register a call-back function.which gets called when a button
 is pressed or held down for the defined number of seconds. Includes
 software key debouncing which may need to be adjusted, the the second 
 argument to AnalogButtons class. Define the ANALOG_PIN in the constructor
 of AnalogButtons.
 
 The circuit:

 * 5 buttons, 1 side of all buttons connected together to +5V. 
   The other side of each button is connected via a different value
   resister (tested with) 1k, 2k5, 5k8, 10k, 18k to one side of a
   100k resister which is in turn connected to GND. At the point
   where all the different resisters are joined you make a connection
   to your analog input. Basicly a different voltage divider is setup 
   depending upon which button is pressed. You have to configure the 
   Buttons Hi/Low values, see the comments in example code below and the
   AnalogButtons::configure(ANALOG_PIN) function.
   
   More or less than 5 buttons could be added, just pick different values
   of the resister sot hat all buttons have different values which arn't too
   close in size.
   
   I'm not sure what happens when Arduino is powered from batteries and Power V
   drops below V5.
 
 by Neil DUdman and everyone who's ever used Arduino
 
 */
#include "AnalogButtons.h"

#define ANALOG_PIN 0

// A call back function that you pass into the constructor of AnalogButtons, see example
// below. Alternitivly you could extend the Button class and re-define the methods pressed() 
// or held() which are called 
void handleButtons(int id, boolean held)
{  
  if (held) {
    Serial.print("button id="); Serial.print(id); Serial.println(" was pressed and held"); 
  } else{
    Serial.print("button id="); Serial.print(id); Serial.println(" was pressed only");
  }
}

AnalogButtons analogButtons(ANALOG_PIN, 30, &handleButtons);
Button b1 = Button(1, 0, 10, 5);
// Default hold duration is 1 second, lets make it 5 seconds for button1
Button b2 = Button(2, 135, 150);
Button b3 = Button(3, 325, 335);
Button b4 = Button(4, 500, 505);
Button b5 = Button(5, 735, 745);

void setup() 
{
  Serial.begin(9600); 
  Serial.println("Testing your Analog buttons");
  
  analogButtons.addButton(b1);
  analogButtons.addButton(b2);
  analogButtons.addButton(b3);
  analogButtons.addButton(b4);
  analogButtons.addButton(b5);  
 }
 
void loop() 
{  
  // To check values when button are pressed
  analogButtons.checkButtons();
  
  // To configure the MAX/Min values for each 
  // Button, uncomment this line, make sure you've called Serial.begin(9600); 
  // Then in turn hold town each botton, noting the max/min values
  // AnalogButtons::configure(ANALOG_PIN); //delay(1000);
}
