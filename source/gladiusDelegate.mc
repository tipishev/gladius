using Toybox.Application as App;
using Toybox.WatchUi as Ui;

var dialogueView;

class gladiusDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(),
                    new gladiusMenuDelegate(),
                    Ui.SLIDE_UP);
        return true;
    }

    function onSelect() {
      Ui.requestUpdate();
    }

    function onPreviousPage() {
      var app = App.getApp();
      app.gladiusView.reset();
    }

    function onNextPage() {
      var dialogue = [
        [:nny_man, "Слышь ты,\nмудак!"],
        [:punchee, "Да, вам\nчто-нибудь\nнужно?"],
        [:nny_man, "На нах,\nёпта!"],
      ];
      dialogueView = new DialogueView(dialogue);
      Ui.pushView(dialogueView, new DialogueDelegate(dialogueView), Ui.SLIDE_UP);
    }

}
