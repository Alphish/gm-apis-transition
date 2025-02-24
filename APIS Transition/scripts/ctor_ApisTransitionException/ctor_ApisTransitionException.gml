function ApisTransitionException(_code, _description) constructor {
    code = _code;
    description = _description;
}

// -------------------
// Creating exceptions
// -------------------

ApisTransitionException.transition_not_linked = function() {
    return new ApisTransitionException(
        $"apis_transition_transition_not_linked",
        $"The transition fade is not linked to the transition instance. It must be linked via 'transition' variable of the new fade instance."
        );
}
