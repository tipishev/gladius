using Toybox.Graphics as Gfx;
using Toybox.Math as Math;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;

// colors
const BIM_START = [60, 200];
const BOM_START = [120, 60];


class Creature {

  protected var _name;
  protected var _color;
  protected var _speed;
  protected var _x;  // FIXME use Point wrapper
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

var bim, bom, tickTimer, avatar, hadDialogue /* FIXME should be state*/;
class gladiusView extends Ui.View {  // FIXME capitalize  class name


    function initialize() {
        View.initialize();
    }

    function reset() {
      bim.setPosition(BIM_START);
      bom.setPosition(BOM_START);
      Ui.requestUpdate();
      hadDialogue = false;
    }

    function onTick() {
      bim.act(bom.getPosition());
      bom.act([240, 120]);
      Ui.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */

        tickTimer = new Timer.Timer();
        tickTimer.start(method(:onTick), 50, true);

        bim = new Creature("Bim", BLACK, 2, BIM_START);
        bom = new Creature("Bom", RED, 1, BOM_START);
        hadDialogue = false;
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
        bom.draw(dc);

        if (!hadDialogue && distance(bim.getPosition(),
                                     bom.getPosition()) < 1) {
          var dialogue = [
            [:nny_man, "Слышь ты,\nмудак!"],
            [:punchee, "Да, вам\nчто-нибудь\nнужно?"],
            [:nny_man, "На нах,\nёпта!"],
          ];
          var dialogueView = new DialogueView(dialogue);
          Ui.pushView(dialogueView, new DialogueDelegate(dialogueView),
                      Ui.SLIDE_UP);
          hadDialogue = true;
        }

    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
