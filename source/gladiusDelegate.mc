using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class gladiusDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new gladiusMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

    function onSelect() {
      Ui.requestUpdate();
    }

    function onPreviousPage() {
      var app = App.getApp();
      app.gladiusView.reset();
    }

}
