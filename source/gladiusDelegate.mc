using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class GladiusDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(),
                    new GladiusMenuDelegate(),
                    Ui.SLIDE_UP);
    }

    function onSelect() {
      Ui.requestUpdate();
    }

    function onPreviousPage() {
      var app = App.getApp();
      app.GladiusView.reset();
    }
}
