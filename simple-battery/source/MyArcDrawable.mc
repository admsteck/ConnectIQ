using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class MyArc extends Ui.Drawable
{
    var radius = 111;
    var color = Gfx.COLOR_GREEN;
    var min = 250;
    var max = 290;
    var direction = Gfx.ARC_CLOCKWISE;
    var percent0to1 = 0.1;

    function initialize(params) {
        Drawable.initialize(params);
    }

    function draw(dc) {
        var width = 240;
        var height = 240;
        var value = min - ((360-(max-min)) * percent0to1);
        var cos = Math.cos(20);
        var sin = Math.sin(20);
        var pointX = width/2 - (cos * ((width/2)-9));
        var pointY = height/2 - (sin * ((width/2)-9));

        // Draw bar
        dc.setColor(color, Gfx.COLOR_TRANSPARENT);
        dc.setPenWidth(16);
        dc.drawArc(120, 120, width/2-9, direction, min, value);

        // Draw bar end
        dc.setPenWidth(8);
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);

        // Draw outline sides
        dc.setPenWidth(1);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawArc(width/2, height/2, width/2-17, direction, min, max);
        dc.drawArc(width/2, height/2, width/2, direction, min, max);

        // Draw ends
        dc.setPenWidth(8);
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
        dc.drawArc(pointX, height-pointY, 12, direction, 70, 250);
        dc.drawArc(width-pointX, height-pointY, 12, direction, 290, 110);

        // Draw outline ends
        dc.setPenWidth(1);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawArc(pointX, height-pointY, 8, direction, 70, 250);
        dc.drawArc(width-pointX, height-pointY, 8, direction, 290, 110);

    }
}

