using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Math as Math;

// colors
const TRANSPARENT = Gfx.COLOR_TRANSPARENT;
const WHITE = Gfx.COLOR_WHITE;
const BLACK = Gfx.COLOR_BLACK;
const RED = Gfx.COLOR_RED;

// functions
const print = Sys.println;

class Creature {

  protected var _name;
  protected var _color;
  protected var _speed;
  protected var _x;
  protected var _y;

  function initialize(name, color, speed, x, y) {
    self._name = name;
    self._color = color;
    self._speed = speed;
    self._x = x;
    self._y = y;
  }

  function toString() {
    return "I am " + self._name + "! At (" + self._x + ", " + self._y + ")";
  }

  function getPosition() {
    return [self._x, self._y];
  }

  function _moveTowards(point) {
    var dx = point[0] - self._x;
    var dy = point[1] - self._y;
    var length = Math.sqrt(dx * dx + dy * dy);
    dx /= length;
    dy /= length;
    dx *= self._speed;
    dy *= self._speed;
    self._x += dx;
    self._y += dy;
  }

  function act(otherPosition) {
    _moveTowards(otherPosition);
  }

  function draw(dc) {
    dc.setColor(self._color, TRANSPARENT);
    dc.fillCircle(self._x, self._y, 10);
  }
}

class gladiusView extends Ui.View {
    var bim, bom;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */
        bim = new Creature("Bim", BLACK, 7, 100, 50);
        bom = new Creature("Bom", RED, 5, 50, 100);
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
        dc.setColor(WHITE, WHITE);
        dc.clear();

        bim.act([120, 120]);
        bom.act([120, 120]);

        bim.draw(dc);
        print(bim.toString());

        bom.draw(dc);
        print(bom.toString());
    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
