fadeout_created = false;
fadein_created = false;

create_fade = function(_object, _params, _duration, _fadesout) {
    var _fadevars = !is_undefined(_params) ? variable_clone(_params, 1) : {};
    _fadevars[$ "transition"] = id;
    _fadevars[$ "duration"] = _duration;
    _fadevars[$ "fades_out"] = _fadesout;
    instance_create_layer(0, 0, layer, _object, _fadevars);
}

with_data = function(_data) {
    apis_transition_get_system().carryover_data = _data;
    return id;
}

perform = function(_action = undefined) {
    fadeout_action = _action ?? fadeout_action;
    create_fade(fadeout_object, fadeout_params, fadeout_duration, true);
}

goto_room = function(_room) {
    apis_transition_get_system().leave_to(_room, id);
    create_fade(fadeout_object, fadeout_params, fadeout_duration, true);
}

restart_room = function(_room) {
    goto_room(room);
}

on_fadeout = function() {
    if (!is_undefined(fadeout_action))
        fadeout_action();
    
    var _system = apis_transition_get_system();
    if (_system.room_transition == id)
        _system.change_room();
    else
        create_fadein();
}

create_fadein = function() {
    create_fade(fadein_object, fadein_params, fadein_duration, false);
}

on_fadein = function() {
    if (!is_undefined(fadein_action))
        fadein_action();
    
    instance_destroy();
}
