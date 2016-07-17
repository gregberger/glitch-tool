import java.awt.Component;

//import org.firmata.*;
//import processing.serial.*;
//import cc.arduino.*;

import java.nio.file.*;
import controlP5.*;
import java.awt.Frame;
import java.awt.BorderLayout;


PImage image, result;
boolean goDraw=false;
String filename="";
JSONObject parameters;

color threshold=0;

// Arduino arduino;

GlitcherInterface glitcher, glitcher1;
GlitcherFactory factory = new GlitcherFactory();

ControlP5 cp5;
ControlFrame cf;
// glitching parameters

int seed=1;
int c=1;
int c2=1;
int tx,ty,tz = 0;
int rx,ry,rz = 0;
int pot1=0;
int heightInterval=1;

int lightC;

boolean saveGlitch = false;
boolean auto = false;
boolean blend = false;
int blendMode = 4;

int prevCount = 0;


void setup() {
  frameRate(24);
  background(255);
  size(100,100,P3D);
  pixelDensity(2);
  cf = new ControlFrame(this, 400, 800, "Glitch Controls");
  glitcher = new GlitcherSix();
  try {
    parameters =  loadJSONObject("data/parameters.json");
    String filename = parameters.getString("filename");
    loadTheImage(filename, true);
  }
  catch(NullPointerException e) {
    println("couldn't load the parameters file");
    parameters = new JSONObject();
  }
  if (image != null && image.width > 0) {
    surface.setSize(image.width, image.height);
  }
  surface.setResizable(true);


  /*
  try {
   arduino = new Arduino(this, "/dev/cu.usbmodem1451", 57600);
   }
   catch(Exception e) {
   arduino = null;
   }
   */
}

void draw() {
  /*
  if(arduino != null){
   pot1 = arduino.analogRead(1);
   }else{
   pot1 = 0;
   }
   
   
   
   if ((millis() - prevCount) > 100) {
   if (pot1 != c2) {
   c2 = pot1;
   }
   println(c2);
   }
   if (c2!=pot1) {
   prevCount = millis();
   }
   */


  if (goDraw) {
    background(255);
    if (!mousePressed) {
      if (auto) {
        c=frameCount%125;

        //c2+=0.01;
        if (frameCount%4==0)
          c2++;
        seed ++;//= noise(c2);
        cf.setSliderValue("color", c);
        cf.setSliderValue("color 2", c2);
        cf.setSliderValue("seed", seed);
      }
      if (image.width>0 && image.height > 0) {
        try {

          result = glitcher.getGlitchImage();
          if (blend) {
            result.blend(image, 0, 0, width, height, 0, 0, result.width, result.height, blendMode%9);
          }
          image(result, 0, 0, result.width, result.height);
        }
        catch(Exception e) {
        }

        if (saveGlitch) {
          saveGlitch=false;
          saveFrame("glitch/still/"+getDateAsString()+"/"+String.valueOf(hour())+"."+String.valueOf(minute())+"_#####.png");
        }
      }
      /** save for gif
       if (frameCount<30) {
       saveGlitch=false;
       saveFrame("glitch/gif/"+getDateAsString()+"/"+String.valueOf(hour())+"."+String.valueOf(minute())+"_#####.gif");
       }
       */
    } else {
      image(image, 0, 0, width, height);
    }
  }
}

void fileSelected(File selection) {
  if (selection != null) {
    Path path = selection.toPath();
    try {
      String content = Files.probeContentType(path);
      println("File content :"+content);
      println("File path "+path);
      filename  = path.toString();
      parameters.setString("filename", filename);
      saveJSONObject(parameters, "data/parameters.json");
      loadTheImage(filename, false);
    }
    catch(IOException e) {
      println(e.getMessage());
    }
  }
}

void mousePressed() {
  threshold = image.pixels[mouseX+mouseY*image.width];
}

void loadTheImage(String filename, boolean isSetup) {

  if (!isSetup) {
    image = loadImage(filename);
  } else {
    image = loadImage(filename);
  }

  if (image.width>=0 && image.height>=0) {
    if (image.width>displayWidth) {
      image.resize(int(displayWidth), 0);
    }
    if (image.height>displayHeight) {
      image.resize(0, int(displayHeight));
    }
    surface.setSize(image.width, image.height);
    surface.setTitle(filename);
    glitcher.init(image);


    goDraw = true;
    loop();
  } else if (image.width == -1) {
    println("erreur");
  } else {
    println(image);
    println("cannot open the file");
    selectInput("Select an Image file !!!!", "fileSelected");
  }
}

void chooseFile() {
  goDraw=false;
  result = null;

  noLoop();
  selectFile();
}

void selectFile() {
  selectInput("Select file", "fileSelected");
}

void saveGlitchFrame() {
  saveGlitch=true;
}


void keyPressed() {
  
  if(key >= 48 && key <= 57){
      glitcher = factory.getGlitcher(key);
      glitcher.init(image);
      
  }
  if (key==CODED) {
    if (keyCode== UP) {
      blendMode++;
    } else if (keyCode==DOWN) {
      blendMode--;
    }
    println("Blend mode "+blendMode%9);
  }
}