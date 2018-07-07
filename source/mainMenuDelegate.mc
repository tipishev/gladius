using Toybox.WatchUi as Ui;

class MainMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :load) {
            print("load game");
        } else if (item == :newGame) {
            print("new game");
        }
    }

}
