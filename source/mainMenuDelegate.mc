using Toybox.WatchUi as Ui;

class MainMenuDelegate extends Ui.MenuInputDelegate {

    private var _view;

    function initialize(view) {
        MenuInputDelegate.initialize();
        self._view = view;
    }

    function onMenuItem(item) {
        if (item == :load) {
            print("load game");
        } else if (item == :newGame) {
            self._view.startNewGame();
        }
    }

}
