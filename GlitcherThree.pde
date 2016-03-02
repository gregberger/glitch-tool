
class GlitcherThree extends GlitcherOne {
  
  
  PImage getGlitchImage() {
    canvas.loadPixels();

    for (int x = 0; x<img.width; x++) {

      for (int y = 0; y<img.height; y++) {
        int px = x+y*width;
        canvas.pixels[px] = img.pixels[px] >> c;
        if (color(canvas.pixels[px]) > color(img.pixels[px]) && px<width*height) {
          for (int i = 0; i<100; i++) {
            if (px<(width) && px>100) {
              canvas.pixels[px] = img.pixels[px]<<c2*y|seed+i<<c*x*x*x*y&c*frameCount;
              if(random(10)<8)
                canvas.pixels[px] = canvas.pixels[px] << x*( c2|c>>(seed+1));
            }
          }
          if (color(img.pixels[px])>color(80)) {
            canvas.pixels[px] = img.pixels[px]<<seed<<c2|c*y;
          }
        }
      }
    }

    canvas.updatePixels();
    
    //canvas.blend(img, int(0+sin(frameCount)*noise(seed)), 0, width, height, int(width*sin(noise(frameCount))), 0, width, height, 4);
    //canvas.blend(img, 0, 0, width, height, 0, 0, width, height, 4);

    return canvas;
  }

  public PImage getImage() {
    return img;
  }
}

