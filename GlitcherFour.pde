class GlitcherFour extends GlitcherOne {


  PImage getGlitchImage() {

    canvas.loadPixels();
    for (int x=0; x<canvas.width; x++) {
      for (int y=0; y<canvas.height; y++) {
        int px = x+y*canvas.width;

        if (px%(height)/c2==0) {
          canvas.pixels[px] = img.pixels[px]|c;
        }else{
           canvas.pixels[px] = img.pixels[px-20]>>c; 
        }
      }
    }

    canvas.updatePixels();

    return canvas;
  }
}