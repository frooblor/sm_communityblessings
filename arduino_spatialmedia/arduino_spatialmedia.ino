int lightingPin1 = 10; //input from IR receiver
int lightingPin2 = 11;
int lightingPin3 = 12;
int lightingPin4 = 13;

int votivePin1 = 1;
int votivePin2 = 2;
int votivePin3 = 3;
int votivePin4 = 4;
int votivePin5 = 5;
int votivePin6 = 6;
int votivePin7 = 7;
int votivePin8 = 8;

//int counter;

//unsigned long duration; //time beam is broken

void setup () {
  
  Serial.begin(9600);
  pinMode(votivePin1, INPUT);
  pinMode(votivePin2, INPUT);
  pinMode(votivePin3, INPUT);
  pinMode(votivePin4, INPUT);
  pinMode(votivePin5, INPUT);
  pinMode(votivePin6, INPUT);
  pinMode(votivePin7, INPUT);
  pinMode(votivePin8, INPUT);
  pinMode(lightingPin1, INPUT);
  pinMode(lightingPin2, INPUT);
  pinMode(lightingPin3, INPUT);
  pinMode(lightingPin4, INPUT);

//pinMode(ledPin, OUTPUT);
  //counter = 0;
  
}

void loop () {
  
  Serial.print(digitalRead(lightingPin1));
  Serial.print(",");
  Serial.print(digitalRead(lightingPin2));
  Serial.print(",");
  Serial.print(digitalRead(lightingPin3));
  Serial.print(",");
  Serial.print(digitalRead(lightingPin4));
  Serial.print(",");
  
  Serial.print(digitalRead(votivePin1));
  Serial.print(",");
  Serial.print(digitalRead(votivePin2));
  Serial.print(",");
  Serial.print(digitalRead(votivePin3));
  Serial.print(",");
  Serial.print(digitalRead(votivePin4));
  Serial.print(",");
  Serial.print(digitalRead(votivePin5));
  Serial.print(",");
  Serial.print(digitalRead(votivePin6));
  Serial.print(",");
  Serial.print(digitalRead(votivePin7));
  Serial.print(",");
  Serial.print(digitalRead(votivePin8));
  Serial.println(",");
  
  
}
  
  
