using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class MainView extends Ui.View {

    hidden var _arc;
    hidden var _goodColor = Gfx.COLOR_GREEN;
    hidden var _warnPercent = .4;
    hidden var _warnColor = Gfx.COLOR_YELLOW;
    hidden var _dangerPercent = .2;
    hidden var _dangerColor = Gfx.COLOR_RED;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        _arc = findDrawableById("BatteryBar");
    }

    function onUpdate(dc) {
        var color = _goodColor;
        var sysStats = Sys.getSystemStats(); 
        var battPercent = (sysStats.battery / 100);
        var battText = sysStats.battery.format("%0.0f") + "%";
        
        if(battPercent < _warnPercent)
        {
            color = _warnColor;
        }
        if(battPercent < _dangerPercent)
        {
            color = _dangerColor;
        }

        findDrawableById("BatteryPercent").setText(battText);

        _arc.percent0to1 = battPercent;
        _arc.color = color;
        View.onUpdate(dc);
        // if(_arc.percent0to1 != battPercent)
        // {
        //     Ui.animate(_arc, :percent0to1, Ui.ANIM_TYPE_EASE_IN_OUT, 1, battPercent, 0.5, null);
        // }
    }
}