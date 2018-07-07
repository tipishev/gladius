using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

const LOREM_IPSUM = ("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

const LOREM_IPSUM_LINED = (
  "Loremnips\n" +
  "dolornsitnipsumosh\n" +
  "qwertyuiopasdfghjklzxcvb\n" +
  "qwertyuiopasdfghjklzxcvbr\n" +
  "qwertyuiopasdfghjklzxcvbr\n" +
  "qwertyuiopasdfghjklzxcvb\n" +
  "dolornsitnipsumosh\n" +
  "Loremnips"
);

// 240x240 round screen specific
const CENTERED_TEXT_OFFSET = [120, 3];
const LINE_LENGTHS = [9, 18, 26, 27, 27, 26, 18, 9];

class PagerView extends Ui.View {

    private var _text, index;

    function initialize(text) {
        View.initialize();
        self._text = LOREM_IPSUM;  // FIXME /* self._text = text; */
        index = 0;
    }

    function drawPage(dc, text) {
      dc.setColor(BLACK, TRANSPARENT);
      dc.drawText(CENTERED_TEXT_OFFSET[0], CENTERED_TEXT_OFFSET[1],
                  Gfx.FONT_SYSTEM_XTINY, text, Gfx.TEXT_JUSTIFY_CENTER);
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
        self.drawPage(dc, self._text);
    }
}
