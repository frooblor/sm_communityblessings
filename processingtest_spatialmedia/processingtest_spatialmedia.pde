import processing.serial.*;

Serial port;
int [] sensors = new int [3];

int state = 0;

void setup () {
  size (640,480);
  smooth();
  
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  port.bufferUntil ('\n');
  
}


void draw () {
  
  if (sensors[2] == 0) {
    if (sensors[0] == 1) {
      fill(255, 0, 0);
    } else if (sensors[1] == 1) {
      fill (0, 255, 0);
    /*} else {
      fill (0);*/
    }
  }  
  
 /* if (sensors[2] == 0) {
    if (sensors[1] == 1) {
      fill (0, 255, 0);
    } else {
      fill (0);
    }
  } else if (sensors[1] == 0) {
    fill (0);
  }*/
    
    rect (0, 0, 640, 480);
   
}

void serialEvent (Serial port) {
  
  String myString = port.readStringUntil('\n');
  
  if (myString != null) {
    println("receiving:" + myString);
    String testString = trim(myString);
    sensors = int(split(testString, ","));
    /*for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      if (sensors[sensorNum] > 0) {
        println("Sensor reading:" + sensorNum);
      }
    }*/    
  }
}

