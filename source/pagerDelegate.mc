using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class PagerDelegate extends Ui.BehaviorDelegate
{
    hidden var _view;
    function initialize(view) {
        self._view = view;
        BehaviorDelegate.initialize();
    }

    function onBack() {
        Ui.popView(Ui.SLIDE_IMMEDIATE);
        return true;
    }

    function onPreviousPage() {
      self._view.showPreviousPage();
    }

    function onNextPage() {
      self._view.showNextPage();
    }
}
