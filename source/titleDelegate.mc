using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class TitleDelegate extends Ui.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        self._view = view;
    }

    function onSelect() {
      /* Ui.requestUpdate(); */
      self._view.showMainMenu();
    }

    function onPreviousPage() {
    }
}
