#include "AnalogButtons.h"

#define ANALOG_PIN         0
#define NUM_TEMP_PROBES    4

enum { tbReadAll = 1, tbReadOne, tbReadTwo, tbReadThree, tbReadFour };

// Read a temperature probe and do something.
void readTempProbe(int probe_id) {
  Serial.print("Probe ");
  Serial.print(probe_id+1);
  Serial.print(" temperature: ");
  // Serial.print(sensors.getTempCByIndex(probe_id));
  Serial.print("0");  // For testing..
  Serial.print("C\n");
}

// Handle a keypad button press
void handleButtons(int id, boolean held)
{
  switch (id)
  {
    case tbReadAll:
      // Read all temperature probes and display results
      if (held)
        for (int probe = 0; probe < NUM_TEMP_PROBES; probe++)
          readTempProbe(probe);      // Read a probe
      break;
      
    default:
      // Read a specific probe:
      if (id > 1 && id-2 < NUM_TEMP_PROBES)
        // If this is a valid temp probe button, read the probe.
        readTempProbe(id-2);
      break;
  }
}

AnalogButtons analogButtons(ANALOG_PIN, 30, &handleButtons);
Button b1 = Button(1, 0, 10, 5);  // Default hold duration is 1 second, lets make it 5 seconds for button1
Button b2 = Button(2, 135, 150);
Button b3 = Button(3, 325, 335);
Button b4 = Button(4, 500, 505);
Button b5 = Button(5, 735, 745);

void setup() 
{
  Serial.begin(9600); 

  analogButtons.addButton(b1);
  analogButtons.addButton(b2);
  analogButtons.addButton(b3);
  analogButtons.addButton(b4);
  analogButtons.addButton(b5);  
}

void loop() 
{
  // Check if any buttons are being pressed:
  analogButtons.checkButtons();
}

