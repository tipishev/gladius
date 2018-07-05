using Toybox.Graphics as Gfx;
using Toybox.Math as Math;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;

// colors
const LEFT_CORNER = [60, 200];
const RIGHT_CORNER = [200, 60];


class Creature {

  protected var _name;
  protected var _color;
  protected var _speed;
  protected var _x;
  protected var _y;

  function initialize(name, color, speed, position) {
    self._name = name;
    self._color = color;
    self._speed = speed;
    self._x = position[0];
    self._y = position[1];
  }

  function toString() {
    return "I am " + self._name + "! At (" + self._x + ", " + self._y + ")";
  }

  function getPosition() {
    return [self._x, self._y];
  }

  function setPosition(point) {
    self._x = point[0];
    self._y = point[1];
  }

  function moveTowards(point) {
    if (self._x == point[0] && self._y == point[1]) {
      return;
    }
    var dx = point[0] - self._x;
    var dy = point[1] - self._y;
    var length = Math.sqrt(dx * dx + dy * dy);
    dx /= length;
    dy /= length;
    dx *= self._speed;
    dy *= self._speed;
    self._x += Math.round(dx);
    self._y += Math.round(dy);
  }


  function act(otherPosition) {
    moveTowards(otherPosition);
  }

  function draw(dc) {
    dc.setColor(self._color, TRANSPARENT);
    dc.fillCircle(self._x, self._y, 10);
  }
}

var bim, bom, timer;
class gladiusView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function reset() {
      bim.setPosition(LEFT_CORNER);
      bom.setPosition(RIGHT_CORNER);
      Ui.requestUpdate();
    }

    function onTick() {
      bim.act(bom.getPosition());
      bom.act([120, 120]);
      Ui.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */

        timer = new Timer.Timer();
        timer.start(method(:onTick), 50, true);

        bim = new Creature("Bim", BLACK, 6, LEFT_CORNER);
        bom = new Creature("Bom", RED, 7, RIGHT_CORNER);
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
        bim.draw(dc);
        print(bim);

        bom.draw(dc);
        print(bom);

    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
