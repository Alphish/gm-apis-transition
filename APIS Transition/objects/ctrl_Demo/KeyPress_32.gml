apis_transition_perform(ctrl_ApisTransition, {
    fadeout_duration: 15,
    fadeout_action: function() { show_debug_message("fadeout finished!"); },
    fadein_duration: 60,
    fadein_action: function() { show_debug_message("fadein finished!"); },
    });
