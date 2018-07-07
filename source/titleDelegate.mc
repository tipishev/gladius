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
      self._view.showMainMenu();
    }
}
