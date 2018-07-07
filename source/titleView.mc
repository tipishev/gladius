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

      var mainMenuDelegate = new MainMenuDelegate();  // TODO pass valid choices

      Ui.pushView(mainMenu, mainMenuDelegate, Ui.SLIDE_UP);
    }

    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
