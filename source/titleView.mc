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
      mainMenu.setTitle(Rez.Strings.mainMenu);
      // TODO don't show in first run
      mainMenu.addItem(Rez.Strings.loadGame, :load);
      mainMenu.addItem(Rez.Strings.newGame, :newGame);

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
