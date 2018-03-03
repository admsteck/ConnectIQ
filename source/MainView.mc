using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class MainView extends Ui.View {

    hidden var arc;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        arc = findDrawableById("BatteryBar");
    }

    function onUpdate(dc) {
        var sysStats = Sys.getSystemStats(); 
        var battPercent = (sysStats.battery / 100);
        var battText = sysStats.battery.format("%0.0f") + "%";
        findDrawableById("BatteryPercent").setText(battText);

        arc.percent0to1 = battPercent;
        View.onUpdate(dc);
        // if(arc.percent0to1 != battPercent)
        // {
        //     Ui.animate(arc, :percent0to1, Ui.ANIM_TYPE_EASE_IN_OUT, 1, battPercent, 0.5, null);
        // }
    }
}