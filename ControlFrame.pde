
class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);

    /*
    Frame f = new Frame(_name);
     f.add(parent);
     this.setup();
     f.setTitle(_name);
     f.setSize(this.w, this.h);
     f.setLocation(1000, 10);
     f.setResizable(false);
     f.setVisible(true);
     */
  }

  public void setup() {
    this.surface.setSize(w, h);

    cp5 = new ControlP5(this);
    cp5.addButton("Choose file").plugTo(parent, "chooseFile").setPosition(10, 10);
    cp5.addButton("Save Frame").plugTo(parent, "saveGlitchFrame").setPosition(10, 40);
    cp5.addToggle("auto").plugTo(parent, "auto").setPosition(10, 70);
    cp5.addToggle("blend").plugTo(parent, "blend").setPosition(10, 110);
    cp5.addNumberbox("seed").plugTo(parent, "seed").setRange(0, 360).setValue(1).setPosition(100, 10).setSize(100, 20);
    cp5.addNumberbox("color").plugTo(parent, "c").setRange(0, 125).setValue(1).setPosition(100, 60).setSize(100, 20);
    cp5.addNumberbox("color 2").plugTo(parent, "c2").setRange(0, 1000).setValue(1).setPosition(100, 110).setSize(100, 20);
    cp5.addNumberbox("translate X").plugTo(parent, "tx").setRange(-1000, 1000).setValue(1).setPosition(100, 150).setSize(100, 20);
    cp5.addNumberbox("translate Y").plugTo(parent, "ty").setRange(-1000, 1000).setValue(1).setPosition(100, 200).setSize(100, 20);
    cp5.addNumberbox("translate Z").plugTo(parent, "tz").setRange(-1000, 1000).setValue(1).setPosition(100, 250).setSize(100, 20);
    cp5.addNumberbox("rotate X").plugTo(parent, "rx").setRange(-1000, 1000).setValue(1).setPosition(100, 300).setSize(100, 20);
    cp5.addNumberbox("rotate Y").plugTo(parent, "ry").setRange(-1000, 1000).setValue(1).setPosition(100, 350).setSize(100, 20);
    cp5.addNumberbox("rotate Z").plugTo(parent, "rz").setRange(-1000, 1000).setValue(1).setPosition(100, 400).setSize(100, 20);
    cp5.addColorWheel("Light color").plugTo(parent, "lightC").setHSL(255,255,255).setPosition(w/2, 500);
    //cp5.addSlider("height Itvl").plugTo(parent, "heightInterval").setRange(100,1).setValue(1).setPosition(100,55);
  }

  public void draw() {
  }

  public ControlP5 control() {
    return cp5;
  }

  public void addBoxes() {
  }

  public void setSliderValue(String name, float val) {
    try {
      cp5.getController(name).setValue(val);
    }
    catch(Exception e) {
      println(e.getClass().getName());
    }
  }
}