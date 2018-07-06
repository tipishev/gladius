using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

const characterToRezId = {
  :nny_man => Rez.Drawables.nny_man,
  :punchee => Rez.Drawables.punchee,
};

const ORIGIN_X = 20;
const ORIGIN_Y = 60;

class DialogueView extends Ui.View {

    hidden var color, _dialogue, index;

    function initialize(dialogue) {
        View.initialize();
        color = Gfx.COLOR_WHITE;
        _dialogue = dialogue;
        index = 0;
    }

    function drawMessage(dc, character, text) {
      var avatar = new Ui.Bitmap({:rezId=>characterToRezId[character],
                                  :locX=>ORIGIN_X, :locY=>ORIGIN_Y});

      // TODO use layout.xml for device-specific placement
      dc.setColor(DARK_BLUE, TRANSPARENT); // background
      dc.fillRoundedRectangle(/*x*/ORIGIN_X - 5,
                              /*y*/ORIGIN_Y,
                              /*w*/200, /*h*/80, /*r*/7);

      avatar.draw(dc);

      dc.setColor(BLACK, TRANSPARENT);
      dc.drawRoundedRectangle(/*x*/ORIGIN_X - 5,
                              /*y*/ORIGIN_Y,
                              /*w*/200, /*h*/80, /*r*/7);

      dc.setColor(WHITE, TRANSPARENT);
      dc.drawText(ORIGIN_X + 170, ORIGIN_Y + 36,
                  Gfx.FONT_SYSTEM_XTINY, text,
                  Gfx.TEXT_JUSTIFY_VCENTER);
    }

    function showNextPhrase() {
      if (self.index < self._dialogue.size() - 1) {
        self.index += 1;
        Ui.requestUpdate();
      } else {
        Ui.popView(Ui.SLIDE_IMMEDIATE);  // close dialogue on last page
      }
    }

    function showPreviousPhrase() {
      if (self.index > 0) {
        self.index -= 1;
        Ui.requestUpdate();
      }
    }


    function onUpdate(dc) {
        dc.setColor(WHITE, WHITE);
        dc.clear();
        var phrase = self._dialogue[self.index];
        var character = phrase[0];
        var text = phrase[1];
        drawMessage(dc, character, text);
    }

}
