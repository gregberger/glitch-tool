class GlitcherSix extends GlitcherOne {


  float boxSize = 10;
  float noiseZseed = 0.1;

  public void init(PImage i) {
    img = i;
    canvas = createImage(img.width, img.height, ARGB);
    pg = createGraphics(img.width, img.height, P3D);
    pg.rectMode(CENTER);
    cf.addBoxes();
  }

  PImage getGlitchImage() {

    pg.beginDraw();
    pg.lights();
    pg.directionalLight((lightC>>16)&0xFF,(lightC>>8)&0xFF,lightC&0xFF,1,0,1);
    pg.background(0);

    img.loadPixels();

    

    //pg.rotateX(radians(rx)*PI);
    //pg.rotateY(radians(ry)*PI);
    //pg.rotateZ(radians(rz)*HALF_PI);

    for (int y = 0; y<=img.height-boxSize; y+=boxSize) {

      for (int x = 0; x<=img.width-boxSize; x+=boxSize) {

        color col = img.pixels[x+y*img.width];

        pg.fill(col, 180);
        pg.noStroke();
        //float z = sin(radians(x))*noise(noiseZseed)*seed;//*int(c&0xFF);
        float z = 100;//int((c2>>8)&0xFF);
        if (int(col>>16&0xFF)<c*5) {

          //pg.pixels[x+y*width] =frameCount*( x<<y*12<<x|43);
          pg.pushMatrix();

          //translate(x+boxSize/2*x/boxSize, height/2, 0);
          //stroke(map(x*y, 0, width*height, 0,255),255,255,100);

          //pg.stroke(col, 80);
          pg.translate(x+boxSize, y+boxSize, z);

          pg.scale((float)seed/360);
          pg.rotateX(radians((col>>8)&0xFF)*PI);
          pg.rotateY(radians((col>>16)&0xFF)*PI);
          // rotateX(sin(radians(millis()/10))*PI);
          pg.rotateZ(radians(col&0xFF)+radians(rz)*PI);

          //pg.noStroke();
          if (! keyPressed) {
            pg.beginShape(TRIANGLE_STRIP);
            pg.texture(image);
            pg.vertex(0, -100, 0, x, y);
            pg.vertex(100, 100, 0, x+boxSize*rx, y+boxSize);      
            pg.vertex(-100, 0, 0, x+boxSize, (y+boxSize*ry));
            //pg.vertex(-100, -100, -100, x, y+boxSize);

            pg.endShape(CLOSE);
            pg.scale(ry/10);
            //pg.box(boxSize);
          } else {
            strokeWeight(c>>16&0xFF);
            stroke(c,c2);
            point(x, y, z);
          }



          pg.popMatrix();
        } else {
          pg.pushMatrix();
          pg.translate(tx, ty, tz);
          //pg.fill(col<<c2>>(y*x), c2);
          pg.fill(col);
          pg.rect(x, y, int(col&0xFF)%(boxSize*3), int(col>>16&0xFF)*boxSize*2);
          pg.popMatrix();
        }
      }
      noiseZseed+=0.002;
    }
    pg.endDraw();
    return pg;
  }
}