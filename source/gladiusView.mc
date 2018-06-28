using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

// colors
const TRANSPARENT = Gfx.COLOR_TRANSPARENT;
const WHITE = Gfx.COLOR_WHITE;
const BLACK = Gfx.COLOR_BLACK;
const RED = Gfx.COLOR_RED;

// functions
const print = Sys.println;

class Fighther {

  protected var _name;
  protected var _color;
  protected var _x;
  protected var _y;

  function initialize(name, color, x, y) {
    self._name = name;
    self._color = color;
    self._x = x;
    self._y = y;
  }

  function toString() {
    return "I am " + self._name + "! At (" + self._x + ", " + self._y + ")";
  }

  function draw(dc) {
    dc.setColor(self._color, TRANSPARENT);
    dc.fillCircle(self._x, self._y, 10);
  }
}

class gladiusView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        /* View.onUpdate(dc); */
        var bim = new Fighther("Bim", BLACK, 100, 50);
        bim.draw(dc);
        print(bim.toString());

        var bom = new Fighther("Bom", RED, 50, 100);
        bom.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
