using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

const LOREM_IPSUM = ("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

const MOSKVA_PETUSHKI = "Первое издание «Москва—Петушки», благо было в одном экземпляре, быстро разошлось. Я получал с тех пор много нареканий за главу «Серп и Молот – Карачарово», и совершенно напрасно. Во вступлении к первому изданию я предупреждал всех девушек, что главу «Серп и Молот – Карачарово» следует пропустить, не читая, поскольку за фразой «И немедленно выпил» следуют полторы страницы чистейшего мата, что во всей этой главе нет ни единого цензурного слова, за исключением фразы «И немедленно выпил».";

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
        self._text = LOREM_IPSUM_LINED;  // FIXME /* self._text = text; */
        index = 0;
    }

    function drawLineBoxes(dc) {
    /* helpers for properly aligning text lines */
    // TODO generate programmatically
      dc.setColor(BLACK, TRANSPARENT);
      var rectangles = [
        [75, 8, 91, 22, 9],
        [36, 34, 171, 22, 18],
        [10, 66, 224, 22, 26],
        [3, 96, 238, 22, 27],

        [1, 126, 240, 22, 27],
        [8, 152, 225, 22, 26],
        [35, 181, 175, 22, 18],
        [72, 211, 95, 22, 9],
      ];
      var i, rectangle, x, y, width, height, size, currentChar;
      currentChar = 0;
      for(i = 0; i < rectangles.size(); i++ ) {
        rectangle = rectangles[i];
        x = rectangle[0];
        y = rectangle[1];
        width = rectangle[2];
        height = rectangle[3];
        size = rectangle[4];
        /* dc.drawRectangle(x, y, width, height); */
        dc.drawText(x, y, Gfx.FONT_SYSTEM_XTINY,
                    /* LOREM_IPSUM.substring(currentChar, currentChar + size), */
                    MOSKVA_PETUSHKI.substring(currentChar, currentChar + size),
                    Gfx.TEXT_JUSTIFY_LEFT);
        currentChar += size;
      }
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
        /* self.drawPage(dc, self._text); */
        self.drawLineBoxes(dc);
    }
}
