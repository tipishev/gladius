using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class DialogueDelegate extends Ui.BehaviorDelegate
{
    hidden var view;
    function initialize(dialogueView) {
        view = dialogueView;
        BehaviorDelegate.initialize();
    }

    function onBack() {
        Ui.popView(Ui.SLIDE_IMMEDIATE);
        return true;
    }

    function onPreviousPage() {
      view.showPreviousPhrase();
    }

    function onNextPage() {
      view.showNextPhrase();
    }
}
