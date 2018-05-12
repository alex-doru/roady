(function() {
    var monitor_keystrokes = function (target) {
        console.log('run', target);
        $(target).keydown(function(event) {
            console.log('pressed', event);

            timeout = setTimeout( function() {
                // call autocomplete api
                // shpw autocomplete suggestions
            }, 500) // always reset timeout on each keystroke
        });
    };

    var monitor_autocomplete_select = function() {
        // monitors autocomplete input
        // when a suggestion is clicked, it overrides the value
    };

    var init = function() {
        monitor_keystrokes()
    };

    Api = {
        // not sure
    };

    monitor_keystrokes('#start_location');
    monitor_keystrokes('#to_location');

    return Api
})();
