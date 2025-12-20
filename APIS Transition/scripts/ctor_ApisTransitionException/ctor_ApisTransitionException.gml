/// @desc An exception to be thrown due to invalid APIS Transition usage.
/// @arg {String} code              The code of the exception to differentiate between different exception causes.
/// @arg {String} description       A detailed description explaining the exception.
function ApisTransitionException(_code, _description) constructor {
    /// @desc The code of the exception to differentiate between different exception causes.
    /// @returns {String}
    code = _code;
    
    /// @desc A detailed description explaining the exception.
    /// @returns {String}
    description = _description;
    
    toString = function() {
        return $"ApisTransition.{code}: {description}";
    }
}

// -------------------
// Creating exceptions
// -------------------

ApisTransitionException.system_not_found = function() {
    return new ApisTransitionException(
        nameof(system_not_found),
        $"An active APIS Transition system instance is required to use APIS Transition functionality."
        );
}

ApisTransitionException.system_duplicate = function() {
    return new ApisTransitionException(
        nameof(system_duplicate),
        $"Only one instance of APIS Transition system can exist at a time."
        );
}

ApisTransitionException.fade_not_linked = function(_fade) {
    return new ApisTransitionException(
        nameof(fade_not_linked),
        $"The transition fade {object_get_name(_fade.object_index)} is not linked to the transition instance. It must be linked via 'transition' variable of the new fade instance."
        );
}

ApisTransitionException.multiple_room_transitions = function(_prevtarget, _newtarget) {
    return new ApisTransitionException(
        nameof(multiple_room_transitions),
        $"Attempting to make a room transition to {room_get_name(_newtarget)} when a transition to {room_get_name(_prevtarget)} has already begun."
        );
}
