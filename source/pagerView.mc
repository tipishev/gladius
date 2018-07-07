using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

// TODO move to resources
const TEXT_ORIGIN_X = 20;
const TEXT_ORIGIN_Y = 60;

class PagerView extends Ui.View {

    private var _text, index;

    function initialize(text) {
        View.initialize();
        self._text = text;
        index = 0;
        print(self._text);
    }

    function drawPage(dc, text) {

      // TODO use layout.xml for device-specific placement
      dc.setColor(BLACK, TRANSPARENT);
      dc.drawText(TEXT_ORIGIN_X + 170, TEXT_ORIGIN_Y + 36,
                  Gfx.FONT_SYSTEM_XTINY, text,
                  Gfx.TEXT_JUSTIFY_VCENTER);
    }

    function showNextPage() {
      if (self.index < self._text.size() - 1) {
        self.index += 1;
        Ui.requestUpdate();
      } else {
        Ui.popView(Ui.SLIDE_IMMEDIATE);  // close dialogue on last page
      }
    }

    function showPreviousPage() {
      if (self.index > 0) {
        self.index -= 1;
        Ui.requestUpdate();
      }
    }


    function onUpdate(dc) {
        dc.setColor(WHITE, WHITE);
        dc.clear();
        /* var phrase = self._dialogue[self.index]; */
        /* var character = phrase[0]; */
        /* var text = phrase[1]; */
        /* drawPage(dc, character, text); */
    }

}
