using Toybox.WatchUi as Ui;

class TitleView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
      setLayout(Rez.Layouts.TitleLayout(dc));
    }

    function showMainMenu() {
      var mainMenu = new Ui.Menu();
      mainMenu.setTitle("Main Menu");  // TODO use resources for strings
      mainMenu.addItem("New Game", :newGame);
      mainMenu.addItem("Load", :load);  // TODO don't show in first run
      Ui.pushView(mainMenu, new GladiusMenuDelegate(), Ui.SLIDE_UP);
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
