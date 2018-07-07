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
      // TODO set valid choices
      var mainMenuDelegate = new MainMenuDelegate(self);

      Ui.pushView(mainMenu, mainMenuDelegate, Ui.SLIDE_UP);
    }

    function startNewGame() {
      Ui.popView(Ui.SLIDE_DOWN);  // popping main menu? maybe move to delegate?
      var text = "So, you're a\ngladiator trainer, Harry!\nGo hire some lucky soul to\nfight for you and rock the\nColoseum!";
      var pagerView = new PagerView(text);
      var pagerDelegate = new PagerDelegate(pagerView);
      Ui.pushView(pagerView, pagerDelegate, Ui.SLIDE_RIGHT);
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
