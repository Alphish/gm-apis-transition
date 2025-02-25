fadeout_created = false;
fadein_created = false;

create_fade = function(_object, _params, _duration, _fadesout) {
    var _fadevars = !is_undefined(_params) ? variable_clone(_params, 1) : {};
    _fadevars[$ "transition"] = id;
    _fadevars[$ "duration"] = _duration;
    _fadevars[$ "fades_out"] = _fadesout;
    instance_create_layer(0, 0, layer, _object, _fadevars);
}

perform = function(_action = undefined) {
    fadeout_action = _action ?? fadeout_action;
    create_fade(fadeout_object, fadeout_params, fadeout_duration, true);
}

goto_room = function(_room) {
    target_room = _room;
    create_fade(fadeout_object, fadeout_params, fadeout_duration, true);
}

restart_room = function(_room) {
    goto_room(room);
}

on_fadeout = function() {
    if (!is_undefined(fadeout_action))
        fadeout_action();
    
    if (is_undefined(target_room))
        create_fadein();
    else if (target_room != room)
        room_goto(target_room);
    else
        room_restart();
}

create_fadein = function() {
    create_fade(fadein_object, fadein_params, fadein_duration, false);
}

on_fadein = function() {
    if (!is_undefined(fadein_action))
        fadein_action();
}
