class Candle { 
  

float x; 
float y; 
float r; 
color c = 255; 

int candleState = 0; //candle is off 

int category = 0; 

  
Candle(float x_, float y_) {
 
 x = x_; 
 y = y_; 
// r = r_; 
// c = c_; 
  
}

void jiggle() {
 x += random(-1, 1); 
 y += random (-1, 1);  
  
}

void display(){
  

  ellipseMode(CENTER);
  fill(c); 
  stroke(0); 
  ellipse(x, y, 100, 100); 
  
}
} 

