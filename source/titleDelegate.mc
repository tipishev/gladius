using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class TitleDelegate extends Ui.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        self._view = view;
    }

    function onSelect() {
      self._view.showMainMenu();
    }

    function onPreviousPage() {
      self._view.showMainMenu();
    }

    function onNextPage() {
      var battleView = new BattleView();
      var battleDelegate = new BattleDelegate(battleView);
      Ui.pushView(battleView, battleDelegate, Ui.SLIDE_RIGHT);
    }
}
