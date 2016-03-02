class GlitcherFive extends GlitcherOne {


  PImage getGlitchImage() {

    canvas.loadPixels();
    //*
    for(int i=0; i<img.pixels.length;i++){
      float x = i%img.width;
      float y = i/img.width;
      color argb = img.pixels[i];
      int a = (argb>>24) & 0xFF;
      int r = (argb>>16) & 0xFF;
      int g = (argb>>8) & 0xFF;
      int b = argb & 0xFF;
      float averageColor = (r+g+b)/3;

     if(averageColor > 100){
     canvas.pixels[i] = img.pixels[i] << seed<<c<<c2;
     }else{
     canvas.pixels[i] = color(255) * int(y) <<c;
      if(x<((img.width/2)+sin(x+y)*seed)){
         
      }else{
         canvas.pixels[i] = color(0)<<int(sin(x))|int(c*y);
      } 
     }


     }
     //*/
     /*
    for (int i=0; i<img.pixels.length; i++) {

      // increment red, green, and blue
      canvas.pixels[i] = color(red(img.pixels[i]) + c2, green(img.pixels[i]) + c, blue(img.pixels[i]) + seed);

      // if values are above 255, set that color back to 0
      if (red(canvas.pixels[i]) >= 255) {
        canvas.pixels[i] = color(0, green(canvas.pixels[i]), blue(canvas.pixels[i]));
      }
      if (green(canvas.pixels[i]) >= 255) {
        canvas.pixels[i] = color(red(canvas.pixels[i]), 0, blue(canvas.pixels[i]));
      }
      if (blue(canvas.pixels[i]) >= 255) {
        canvas.pixels[i] = color(red(canvas.pixels[i]), green(canvas.pixels[i]), 0);
      }

    }
    */
    canvas.updatePixels();

    return canvas;
  }
}
