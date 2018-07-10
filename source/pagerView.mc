using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using MyStringUtils as StringUtils;

const charAt = StringUtils.charAt;
const NEWLINE = "\n";
const WHITESPACE = " ";

const LOREM_IPSUM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

const LOREM_IPSUM_META = "In publishing and graphic design, lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document without relying on meaningful content (also called greeking). Replacing the actual content with placeholder text allows designers to design the form of the content before the content itself has been produced.";

const MOSKVA_PETUSHKI = "Первое издание «Москва—Петушки», благо было в одном экземпляре, быстро разошлось. Я получал с тех пор много нареканий за главу «Серп и Молот – Карачарово», и совершенно напрасно. Во вступлении к первому изданию я предупреждал всех девушек, что главу «Серп и Молот – Карачарово» следует пропустить, не читая, поскольку за фразой «И немедленно выпил» следуют полторы страницы чистейшего мата, что во всей этой главе нет ни единого цензурного слова, за исключением фразы «И немедленно выпил».";

const FONT = Gfx.FONT_SYSTEM_XTINY;
const JUSTIFY_LEFT = Gfx.TEXT_JUSTIFY_LEFT;

class PagerView extends Ui.View {

    private var _text, index, _startingFrom;

    function initialize(text) {
        View.initialize();
        self._text = LOREM_IPSUM_META;  // FIXME /* self._text = text; */
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
      var lastWordEnd, potentialOffset, start, end, buffer, tempBuffer;
      start = 0;
      for(i = 0; i < rectangles.size(); i++ ) {
        rectangle = rectangles[i];

        x = rectangle[0];
        y = rectangle[1];
        width = rectangle[2];
        height = rectangle[3];
        dc.drawRectangle(x, y, width, height);

        lastWordEnd = 0;
        potentialOffset = 0;
        var finalOffset = 0;
        while (true) {
          /* print(charAt(self._text, 5)); */
          // TODO try/catch out of bound exception
          potentialOffset += 1;
          var newChar = charAt(self._text, potentialOffset);
          if (newChar == NEWLINE) {
            finalOffset += 1;  // consume newline
            break;
          }

          print(newChar);
          if (newChar.equals(WHITESPACE)) {
            lastWordEnd = potentialOffset;  // it may come useful
          }

          var potentialString = self._text.substring(start, start + potentialOffset);
          var potentialWidth = measureText(dc, potentialString);

          if (potentialWidth > width) {  // oops, we're over budget
            if (newChar.equals(WHITESPACE)) {
              finalOffset += 1; // consume whitespace
              break;
            } else { // mid-word
              if (lastWordEnd != 0) {
                finalOffset = lastWordEnd;  // next line deals with this shit
                break;
              } else { // this whole line is a long-ass word, print part of it
                break;
              }
            }
          } else {
            finalOffset += 1;  // consume this character
          }
        }

        end = start + finalOffset;

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
