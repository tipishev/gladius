using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

// colors
const TRANSPARENT = Gfx.COLOR_TRANSPARENT;
const WHITE = Gfx.COLOR_WHITE;
const BLACK = Gfx.COLOR_BLACK;
const RED = Gfx.COLOR_RED;

class gladiusView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        /* setLayout(Rez.Layouts.MainLayout(dc)); */
        /* dc.setColor(WHITE, WHITE); */
        /* dc.fillCircle(120, 120, 120); */
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.setColor(WHITE, WHITE);
        dc.fillCircle(100, 50, 10);

        dc.setColor(RED, WHITE);
        dc.fillCircle(50, 100, 10);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
