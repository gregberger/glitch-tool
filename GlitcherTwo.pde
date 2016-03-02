class GlitcherTwo extends GlitcherOne {


  PImage getGlitchImage() {
    canvas.loadPixels();
    for (int x = 0; x<img.width/2; x++) {
      for (int y = 0; y<img.height; y++) {
        int px = x+y*width;
        canvas.pixels[px] = img.pixels[px]<<c+y|seed^x;

        canvas.pixels[width*y+width-(x+1)] = img.pixels[px]<<c2|seed^(c);

        //canvas.pixels[px] -= seed+c*y+x;
      }
    }
    canvas.updatePixels();

    return canvas;
  }
}

