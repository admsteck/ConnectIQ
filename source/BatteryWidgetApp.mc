using Toybox.Application as App;

class BatteryWidget extends App.AppBase
{
    var mSensor;

    function initialize() {
        App.AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {

    }

    // onStop() is called when your application is exiting
    function onStop(state) {

    }

    // Return the initial view of your application here
    function getInitialView() {
        //The initial view is located at index 0
        return [new MainView(), new MainViewDelegate()];
    }
}
