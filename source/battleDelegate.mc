using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class BattleDelegate extends Ui.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        self._view = view;
    }

    function onSelect() {
      self._view.reset();
    }
}
