function ApisTransitionException(_code, _description) constructor {
    code = _code;
    description = _description;
    
    toString = function() {
        return description;
    }
}

// -------------------
// Creating exceptions
// -------------------

ApisTransitionException.system_not_found = function() {
    return new ApisTransitionException(
        $"apis_transition_system_not_found",
        $"Cannot use the APIS Transition functionality without an active APIS Transition system instance."
        );
}

ApisTransitionException.system_duplicate = function() {
    return new ApisTransitionException(
        $"apis_transition_system_duplicate",
        $"Cannot create another instance of APIS Transition system. Only one instance of APIS Transition system can exist at a time."
        );
}

ApisTransitionException.transition_not_linked = function() {
    return new ApisTransitionException(
        $"apis_transition_transition_not_linked",
        $"The transition fade is not linked to the transition instance. It must be linked via 'transition' variable of the new fade instance."
        );
}
