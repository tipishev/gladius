using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using MyStringUtils as StringUtils;

const charAt = StringUtils.charAt;
const isWhitespace = StringUtils.isWhitespace;

const NEWLINE = "\n";

const LOREM_IPSUM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

const LOREM_IPSUM_META = "In publishing and graphic design, lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document without relying on meaningful content (also called greeking). Replacing the actual content with placeholder text allows designers to design the form of the content before the content itself has been produced.";

const MOSKVA_PETUSHKI = "я предупреждал всех девушек, что главу «Серп и Молот – Карачарово» следует пропустить, не читая, поскольку за фразой «И немедленно выпил» следуют полторы страницы чистейшего мата, что во всей этой главе нет ни единого цензурного слова, за исключением фразы «И немедленно выпил».";

const FONT = Gfx.FONT_SYSTEM_XTINY;
const JUSTIFY_LEFT = Gfx.TEXT_JUSTIFY_LEFT;

class PagerView extends Ui.View {

    private var _text, index, _startingFrom;

    function initialize(text) {
        View.initialize();
        self._text = MOSKVA_PETUSHKI;  // FIXME /* self._text = text; */
        index = 0;
        self._startingFrom = 0;
    }

    function measureText(dc, text) {
      return dc.getTextWidthInPixels(text, FONT);
    }

    function drawTextLines(dc) {
    /* helpers for properly aligning text lines */
      dc.setColor(BLACK, TRANSPARENT);

      // TODO generate programmatically
      var rectangles = [
        [75, 8, 91, 22],
        [36, 34, 171, 22],
        [10, 66, 224, 22],
        [3, 96, 238, 22],

        [1, 126, 240, 22],
        [8, 152, 225, 22],
        [35, 181, 175, 22],
        [72, 211, 95, 22],
      ];

      // FIXME use lastWordEnd semantics
      var i, j;
      var rectangle, x, y, width, height;
      var offset, lastWordEnd, start, end, buffer, tempBuffer;
      start = 0; // first character in text to print
      for (i = 0; i < rectangles.size(); i++ ) {
        rectangle = rectangles[i];

        x = rectangle[0];
        y = rectangle[1];
        width = rectangle[2];
        height = rectangle[3];
        dc.drawRectangle(x, y, width, height);

        lastWordEnd = null;
        offset = 0;

        // filling up current rectangle
        while (true) {
          // TODO try/catch out of bound exception
          var newChar = charAt(self._text, start + offset);
          if (newChar.equals(NEWLINE)) {
            offset += 1;  // consume newline
            break;
          }

          if (isWhitespace(newChar) || newChar.equals("—")) {
            lastWordEnd = offset;
          }

          var potentialString = self._text.substring(start, start + offset + 1);
          var potentialWidth = measureText(dc, potentialString);

          if (potentialWidth > width) {  // oops, we're over budget, act now
            if (lastWordEnd != null) {
              offset = lastWordEnd + 1;  // +1 to consume space
            }
            break;
          } else {  // all good, it fits
            offset += 1;  // consume this character
          }
        }

        end = start + offset;

        // need to guarantee that the text fits in the box
        dc.drawText(x, y, FONT, self._text.substring(start, end), JUSTIFY_LEFT);
        start = end;
      }
    }

    function showNextPage() {
      self._startingFrom += 100;
      Ui.requestUpdate();
    }

    function showPreviousPage() {
      self._startingFrom -= 100;
      Ui.requestUpdate();
    }

    function onUpdate(dc) {
        dc.setColor(WHITE, WHITE);
        dc.clear();
        self.drawTextLines(dc);
    }
}
