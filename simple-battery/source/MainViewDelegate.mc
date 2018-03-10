using Toybox.WatchUi as Ui;

class MainViewDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new MenuDelegate(), Ui.SLIDE_LEFT);
        return true;
    }
}
