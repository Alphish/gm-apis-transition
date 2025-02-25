function apis_transition_get_system() {
    if (!instance_exists(sys_ApisTransition))
        throw ApisTransitionException.system_not_found();
    
    return sys_ApisTransition.id;
}

function apis_transition_prepare(_transition = undefined, _params = undefined) {
    var _system = apis_transition_get_system();
    _transition = _transition ?? _system.default_transition;
    
    var _instance = !is_undefined(_params)
        ? instance_create_layer(0, 0, _system.transition_layer, _transition, _params)
        : instance_create_layer(0, 0, _system.transition_layer, _transition);
    
    return _instance;
}

function apis_transition_perform(_action = undefined, _transition = undefined, _params = undefined) {
    var _instance = apis_transition_prepare(_transition, _params);
    _instance.perform(_action);
    return _instance;
}

function apis_transition_goto_room(_room, _transition = undefined, _params = undefined) {
    var _instance = apis_transition_prepare(_transition, _params);
    _instance.goto_room(_room);
    return _instance;
}

function apis_transition_restart_room(_transition = undefined, _params = undefined) {
    var _instance = apis_transition_prepare(_transition, _params);
    _instance.restart_room();
    return _instance;
}
