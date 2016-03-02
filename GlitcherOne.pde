import java.lang.Exception;
class GlitcherOne implements GlitcherInterface {

  protected PImage img;
  protected PImage canvas;
  protected PGraphics pg;
  

  void init(PImage i) {
    img = i;
    canvas = createImage(img.width, img.height, ARGB);
  }

  PImage getGlitchImage() {
    
    canvas.loadPixels();
    float imgSize = img.width*img.height;
    float th = 3;
    float r = 0.2;
    for(int p =0; p<imgSize-100; p++){
      float x = p/img.width;
      float y = p%img.width;
      canvas.pixels[p] = img.pixels[p]<<c|p<<int(y/c2+x);
      
      r+=0.02;
      th+=0.3;
    } 
    /*
    for (int x=0; x<img.width; x++) {
      for (int y=0; y<img.height; y++) {
        int px = x+y*width;
        if (px<=img.pixels.length) {
          if (color(img.pixels[px]) > color(c)) {
            canvas.pixels[px] = img.pixels[px] << c2 |y*seed<<(x*c)>>(y);
          } else {
            canvas.pixels[px] =int(noise(seed)*c*c*c*c)<<img.pixels[px]+ int(c2-seed*map(y,0,height,1,100));
          }
        }
      }
    }
    */
    canvas.updatePixels();
    return canvas;
    
    
  } 

  PGraphics getGlitchGraphics() {
    return pg;
  }
  
  public PImage getImage(){
     return img; 
  }

  public void setImage(PImage i){
     img = i; 
  }
  private void glitch() throws Exception {
    checkParameters();
  }

  private void checkParameters() throws Exception {
    if (img == null) {
      throw new Exception();
    }
  }
}