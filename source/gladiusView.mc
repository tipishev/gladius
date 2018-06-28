using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Math as Math;

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

var bim, bom, pointA, pointB, vector;  // global otherwise reset does not see
class gladiusView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function reset() {
      bim.setPosition(LEFT_CORNER);
      bom.setPosition(RIGHT_CORNER);
      Ui.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */
        bim = new Creature("Bim", BLACK, 7, LEFT_CORNER);
        bom = new Creature("Bom", RED, 5, RIGHT_CORNER);
        pointA = new Point(120, 120);
        print(pointA);
        pointB = new Point(100, 100);
        print(pointB.toString());
        vector = new Vector(pointA, pointB);
        print(vector.toString());
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
        /* print(bim.toString()); */

        bom.draw(dc);
        /* print(bom.toString()); */
    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
