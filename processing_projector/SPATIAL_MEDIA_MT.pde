import codeanticode.gsvideo.*;
import ixagon.SurfaceMapper.*;
import processing.opengl.*;
import codeanticode.glgraphics.*;

GLTexture tex;
GLTexture img;
GLGraphicsOffScreen glos;
SurfaceMapper sm;
GSMovie movie;

void setup(){
  size(1600,1050, GLConstants.GLGRAPHICS);
  glos = new GLGraphicsOffScreen(this, width, height, false);
  tex = new GLTexture(this);
  
  img = new GLTexture(this, "img.jpg");
  //Create new instance of SurfaceMapper
  sm = new SurfaceMapper(this, width, height);
  //Creates one surface with subdivision 3, at center of screen
  sm.createBezierSurface(3,width/2,height/2);
  
  movie = new GSMovie(this, "streets.mp4");
  movie.setPixelDest(tex);  
  movie.loop();
}

void draw(){
  background(0);
 
  glos.beginDraw();
  glos.clear(0);
  glos.hint(ENABLE_DEPTH_TEST);
  glos.endDraw();
 
  //get movie frame
  if(tex.putPixelsIntoTexture())
  
  //Updates the shaking of the surfaces in render mode
  sm.shake();
  
  //render all surfaces in calibration mode
  if(sm.getMode() == sm.MODE_CALIBRATE)sm.render(glos);
  //render all surfaces in render mode
  if(sm.getMode() == sm.MODE_RENDER){        
    
    //for each ss in array getSurfaces 
    for(SuperSurface ss : sm.getSurfaces()){
      //render this surface to GLOS, use TEX as texture
      if(ss.getId() % 2 == 0) ss.render(glos,tex);
      else ss.render(glos, img);
    }
  }
  //display the GLOS to screen
  image(glos.getTexture(),0,0,width,height);
  
  if(mouseX > 200)
  {
    
  }
}

void movieEvent(GSMovie movie) {
  movie.read();
}

//CALIBRATION SETTINGS - FOR TESTING 
void keyPressed(){
  
  //create a new QUAD surface at mouse pos
  if(key == 'a')sm.createQuadSurface(3,mouseX,mouseY);
  //create new BEZIER surface at mouse pos
  if(key == 'z')sm.createBezierSurface(3,mouseX,mouseY);
  //switch between calibration and render mode
  if(key == 'c')sm.toggleCalibration();
  //increase subdivision of surface
  if(key == 'p'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.increaseResolution();
    }
  }
  //decrease subdivision of surface
  if(key == 'o'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.decreaseResolution();
    }
  }
  //save layout to xml
  if(key == 's')sm.save("bla2.xml");
  //load layout from xml
  if(key == 'l')sm.load("bla2.xml");
  //rotate how the texture is mapped in to the QUAD (clockwise)
  if(key == 'j'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.rotateCornerPoints(0);
    }
  }
  //rotate how the texture is mapped in to the QUAD (counter clockwise)
  if(key == 'k'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.rotateCornerPoints(1);
    }
  }
  //increase the horizontal force on a BEZIER surface
  if(key == 't'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.increaseHorizontalForce();
    }
  }
  //decrease the horizontal force on a BEZIER surface  
  if(key == 'y'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.decreaseHorizontalForce();
    }
  }
  //increase the vertical force on a BEZIER surface  
  if(key == 'g'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.increaseVerticalForce();
    }
  }
  //decrease the vertical force on a BEZIER surface  
  if(key == 'h'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.decreaseVerticalForce();
    }
  }
      //shake all surfaces with strength (max z displacement) and speed
  if(key == 'q'){
    sm.setShakeAll(50, 850, 0);
  }
    //shake all surfaces with strength (max z displacement) and speed
  if(key == 'w'){
    sm.setShakeAll(75, 650, 0);
  }
    //shake all surfaces with strength (max z displacement) and speed
  if(key == 'e'){
    sm.setShakeAll(100, 450, 0);
  }
    //shake only the selected surfaces with strength (max z displacement) and speed
  if(key == 'r'){
    for(SuperSurface ss : sm.getSelectedSurfaces()){
      ss.setShake(200,400, 0);
    }
  }
}
