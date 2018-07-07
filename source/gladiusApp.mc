using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class GladiusApp extends App.AppBase {
    private var gameState;

    function initialize() {
        AppBase.initialize();
        /* self.setProperty(Rez.Strings.gameStatePropertyName, "foo"); */
        gameState = self.getProperty(Rez.Strings.gameStatePropertyName);
        print(gameState);
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        var titleView = new TitleView();
        var titleDelegate = new TitleDelegate(titleView);
        return [titleView, titleDelegate];
    }

}
