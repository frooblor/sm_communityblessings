//Surface Mapper 
import codeanticode.gsvideo.*;
import ixagon.SurfaceMapper.*;
import processing.opengl.*;
import codeanticode.glgraphics.*;

//serial 
import processing.serial.*; 

Serial port; 
int [] vSensors = new int[6];  // 6 votives 
int [] lSensors = new int[4]; //4 lighting 



GLTexture cat1, cat2, cat3, cat4; 
GLGraphicsOffScreen glos;
SurfaceMapper sm;

Candle [] votives = new Candle [6];  
GLTexture [] tex = new GLTexture[6]; 
SuperSurface v0, v1, v2, v3, v4, v5; 


void setup()
{
 size(1440, 900, GLConstants.GLGRAPHICS); 
 
 glos = new GLGraphicsOffScreen(this, width, height, false); 
 
 //Votive Candles 
  
 //initialize - do i need this? 
 for(int k = 0; k< tex.size; k++)
 {
  tex[k] = new GLTexture(this);  
 }

 cat1 = new GLTexture(this, "blue.png"); 
 cat2 = new GLTexture(this, "green.png"); 
 cat3 = new GLTexture(this, "red.png"); 
 cat4 = new GLTexture(this, "yellow.png"); 
 
 //new instance of SM 
  sm = new SurfaceMapper(this, width, height); 
   
 
 //initialize all votives  
  votives[0] = new Candle(100, 100);  
  v0 = sm.createBezierSurface(3,100,100);
  
  votives[1] = new Candle(200, 100);  
  v1 = sm.createBezierSurface(3,200,100);
  
  votives[2] = new Candle(300, 100);  
  v2 = sm.createBezierSurface(3,300,100);
  
  votives[3] = new Candle(400, 100);  
  v3 = sm.createBezierSurface(3,400,100);
  
  votives[4] = new Candle(500, 100);  
  v4 = sm.createBezierSurface(3,500,100);
  
  votives[5] = new Candle(600, 100);  
  v5 = sm.createBezierSurface(3,600,100);
  
  println(Serial.list()); 
  port = new Serial(this, Serial.list()[0], 9600); 
  port.bufferUntil('\n'); 
}

void draw(){

  background(0); 
  smooth(); 
 
 glos.beginDraw(); 
 glos.clear(0); 
 glos.endDraw(); 
 
// sm.shake(); 
 
 if(sm.getMode() == sm.MODE_CALIBRATE)sm.render(glos); 
 
 if(sm.getMode() == sm.MODE_RENDER){
   v0.render(glos, tex[0]);  
   v1.render(glos, tex[1]); 
   v2.render(glos, tex[2]); 
   v3.render(glos, tex[3]); 
   v4.render(glos, tex[4]);
   v5.render(glos, tex[5]); 
 }
 
 for(int i = 0; i < vSensors.size; i++)
 {
  if(vSensors[i] == 0){
     if(lSensors[0] == 1) 
     {
          tex[i] = cat1; 
          votives[i].candleState = 1;
      
     }
     if(lSensors[1] == 1) 
     {
          tex[i] = cat1; 
          votives[i].candleState = 1;
      
     }
      if(lSensors[2] == 1) 
     {
          tex[i] = cat1; 
          votives[i].candleState = 1;
      
     }
      if(lSensors[3] == 1) 
     {
          tex[i] = cat1; 
          votives[i].candleState = 1;
      
     }
   
  } 
 }
  
 image(glos.getTexture(), 0, 0, width, height);
 
  
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

void keyPressed() {
  
   if(key == ' ')
   {
     sm.toggleCalibration();
   }
} 

