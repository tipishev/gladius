using Toybox.Application as App;

class GladiusApp extends App.AppBase {
    public var gameState;

    function load() {
      return self.getProperty(Rez.Strings.gameStatePropertyName);
    }

    function save() {
      return self.setProperty(Rez.Strings.gameStatePropertyName,
                              self.gameState);
    }

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
      self.gameState = self.load();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
      self.save();
    }

    // Return the initial view of your application here
    function getInitialView() {
        var titleView = new TitleView();
        var titleDelegate = new TitleDelegate(titleView);
        return [titleView, titleDelegate];
    }

}
