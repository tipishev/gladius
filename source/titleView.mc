using Toybox.WatchUi as Ui;
using Toybox.Application as App;

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

      if (App.getApp().gameState != null) {
        mainMenu.addItem(Rez.Strings.loadGame, :load);
      }

      mainMenu.addItem(Rez.Strings.newGame, :newGame);

      var mainMenuDelegate = new MainMenuDelegate();  // TODO set valid choices

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
