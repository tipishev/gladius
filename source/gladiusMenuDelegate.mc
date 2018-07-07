using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class GladiusMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            print("item 1");
        } else if (item == :item_2) {
            print("item 2");
        }
    }

}
