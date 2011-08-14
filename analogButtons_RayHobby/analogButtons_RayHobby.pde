int buttonPin = 0;
int buttonValue = 0;

void setup() {
  Serial.begin(9600);  
  Serial.println("Ready.");
}

void loop() {
  buttonValue = analogRead(buttonPin);
  if (buttonValue > 700) {
    Serial.print('1');
    while (buttonValue > 700) {
      buttonValue = analogRead(buttonPin);
    }
  }
  else if (buttonValue > 500) {
    Serial.print('2');    
    while (buttonValue > 500) {
      buttonValue = analogRead(buttonPin);
    }    
  }
  else if (buttonValue > 300) {
    Serial.print('3');
    while (buttonValue > 300) {
      buttonValue = analogRead(buttonPin);
    }
  }
  else if (buttonValue > 100) {
    Serial.print('4').
    while (buttonValue > 100) {
      buttonValue = analogRead(buttonPin);
    }
  }
  delay(25);
}
