int receiverPin1 = 8; //input from IR receiver
int receiverPin2 = 9;
int receiverPin3 = 10;
//int ledPin = 8;
//int counter;

//unsigned long duration; //time beam is broken

void setup () {
  
  Serial.begin(9600);
  pinMode(receiverPin1, INPUT);
  pinMode(receiverPin2, INPUT);
  pinMode(receiverPin3, INPUT);
  //pinMode(ledPin, OUTPUT);
  //counter = 0;
  
}

void loop () {
/*  if (digitalRead(receiverPin1) == HIGH && digitalRead(receiverPin2) == LOW) {
    digitalWrite(ledPin, HIGH);
  } else if (digitalRead(receiverPin1) == LOW && digitalRead(receiverPin2) == HIGH) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin, LOW);
  }*/
  
  Serial.print(digitalRead(receiverPin1));
  Serial.print(",");
  Serial.print(digitalRead(receiverPin2));
  Serial.print(",");
  Serial.println(digitalRead(receiverPin3));
  
  
}
  
  
