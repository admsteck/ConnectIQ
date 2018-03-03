using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Item1) {
            Sys.println("Item 1");
            //Ui.pushView(new Rez.Menus.AuxMenu(), new AuxMenuDelegate(), Ui.SLIDE_UP);
        } else if (item == :Item2) {
            Sys.println("Item 2");
        }
    }
}
