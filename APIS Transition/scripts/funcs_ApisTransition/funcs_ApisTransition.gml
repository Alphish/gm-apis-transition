/// @desc Retrieves the instance of the APIS transition system.
/// @returns {Id.Instance<sys_ApisTransition>}
function apis_transition_get_system() {
    if (!instance_exists(sys_ApisTransition))
        throw ApisTransitionException.system_not_found();
    
    return sys_ApisTransition.id;
}

/// @desc Prepares a transition with its parameters and data, ready to be performed later.
/// @arg {Asset.GMObject} [transition]      The object of the transition to create.
/// @arg {Struct} [params]                  The values to initialise the transition instance with.
/// @arg {Any} [data]                       The data to carry over throughout the transition.
/// @returns {Id.Instance}
function apis_transition_build(_transition = undefined, _params = undefined, _data = undefined) {
    var _system = apis_transition_get_system();
    _transition = _transition ?? _system.default_transition;
    
    var _instance = !is_undefined(_params)
        ? instance_create_layer(0, 0, _system.transition_layer, _transition, _params)
        : instance_create_layer(0, 0, _system.transition_layer, _transition);
    
    return _instance.with_data(_data);
}

/// @desc Prepares a transition, then immediately performs it with a given action.
/// @arg {Function} [action]                The action to perform in the middle of the transition.
/// @arg {Asset.GMObject} [transition]      The object of the transition to create.
/// @arg {Struct} [params]                  The values to initialise the transition instance with.
/// @arg {Any} [data]                       The data to carry over throughout the transition.
/// @returns {Id.Instance}
function apis_transition_perform(_action = undefined, _transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.perform(_action);
    return _instance;
}

/// @desc Prepares a transition and uses it to move to a given room.
/// @arg {Asset.GMRoom} room                The room to move to.
/// @arg {Asset.GMObject} [transition]      The object of the transition to create.
/// @arg {Struct} [params]                  The values to initialise the transition instance with.
/// @arg {Any} [data]                       The data to carry over throughout the transition.
/// @returns {Id.Instance}
function apis_transition_goto_room(_room, _transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.goto_room(_room);
    return _instance;
}

/// @desc Prepares a transition and uses it to restart the current room. 
/// @arg {Asset.GMObject} [transition]      The object of the transition to create.
/// @arg {Struct} [params]                  The values to initialise the transition instance with.
/// @arg {Any} [data]                       The data to carry over throughout the transition.
/// @returns {Id.Instance}
function apis_transition_restart_room(_transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.restart_room();
    return _instance;
}

/// @desc Checks if a room-leaving transition is already in progress.
/// @returns {Bool}
function apis_transition_leaves_room() {
    return !is_undefined(apis_transition_get_system().target_room);
}

/// @desc Retrieves the data carried over throughout the current transition.
/// @returns {Any}
function apis_transition_get_data() {
    return apis_transition_get_system().carryover_data;
}
