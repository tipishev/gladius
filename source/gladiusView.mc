using Toybox.Graphics as Gfx;
using Toybox.Math as Math;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;

const BIM_START = new Point(60, 200);
const BOM_START = new Point(120, 60);
const BOM_DESTINATION = new Point(240, 120);


// TODO move out to separate file
class Creature {

  protected var _name;
  protected var _color;
  protected var _speed;
  protected var _position;

  function initialize(name, color, speed, position) {
    self._name = name;
    self._color = color;
    self._speed = speed;
    self._position = new Point(position.x, position.y);
  }

  function toString() {
    return "I am " + self._name + "! At " + self._position;
  }

  function getPosition() {
    return self._position.clone();
  }

  function setPosition(point) {
    self._position.readFrom(point);
  }

  function moveTowards(point) {
    if (self._position.equals(point)) {
      return;
    }
    var displacementVector = new Vector(self._position, point).toUnitVector().scale(self._speed);
    self._position.addVector(displacementVector);
  }

  function draw(dc) {
    dc.setColor(self._color, TRANSPARENT);
    dc.fillCircle(self._position.x, self._position.y, 15);
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
      hadDialogue = false;
      Ui.requestUpdate();
    }

    function onTick() {
      bim.moveTowards(bom.getPosition());
      bom.moveTowards(BOM_DESTINATION);
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

        if (!hadDialogue &&
            bim.getPosition().distanceTo(bom.getPosition()) < 1) {
          var dialogue = [
            /* [:nny_man, "Слышь ты,\nмудак!"], */
            /* [:punchee, "Да, вам\nчто-нибудь\nнужно?"], */
            /* [:nny_man, "На нах,\nёпта!"], */
            [:nny_man, "Hey you,\nasshole!"],
            [:punchee, "Yes, do\nyou need\nanything?"],
            [:nny_man, "Here, have\nsome!"],
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
