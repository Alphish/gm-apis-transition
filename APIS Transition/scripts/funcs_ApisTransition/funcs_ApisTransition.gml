function apis_transition_get_system() {
    if (!instance_exists(sys_ApisTransition))
        throw ApisTransitionException.system_not_found();
    
    return sys_ApisTransition.id;
}

function apis_transition_build(_transition = undefined, _params = undefined, _data = undefined) {
    var _system = apis_transition_get_system();
    _transition = _transition ?? _system.default_transition;
    
    var _instance = !is_undefined(_params)
        ? instance_create_layer(0, 0, _system.transition_layer, _transition, _params)
        : instance_create_layer(0, 0, _system.transition_layer, _transition);
    
    return _instance.with_data(_data);
}

function apis_transition_perform(_action = undefined, _transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.perform(_action);
    return _instance;
}

function apis_transition_goto_room(_room, _transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.goto_room(_room);
    return _instance;
}

function apis_transition_restart_room(_transition = undefined, _params = undefined, _data = undefined) {
    var _instance = apis_transition_build(_transition, _params, _data);
    _instance.restart_room();
    return _instance;
}

function apis_transition_leaves_room() {
    return !is_undefined(apis_transition_get_system().target_room);
}

function apis_transition_get_data() {
    return apis_transition_get_system().carryover_data;
}
