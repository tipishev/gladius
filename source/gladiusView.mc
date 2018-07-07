using Toybox.WatchUi as Ui;

class GladiusView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
      setLayout(Rez.Layouts.MainLayout(dc));
      // maybe in intialize? TODO
      var menu = new Ui.Menu();
      menu.setTitle("Main Menu");
      menu.addItem("New Game", :newGame);
      menu.addItem("Load", :load);  // TODO don't show in first run
      Ui.pushView(menu,
                  new GladiusMenuDelegate(),
                  Ui.SLIDE_UP);  // TODO SLIDE_IMMEDIATE
    }

    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
