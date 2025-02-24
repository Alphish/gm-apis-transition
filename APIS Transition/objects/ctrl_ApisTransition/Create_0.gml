fadeout_created = false;
fadein_created = false;

create_fade = function(_object, _params, _duration, _fadesout) {
    var _fadevars = !is_undefined(_params) ? variable_clone(_params, 1) : {};
    _fadevars[$ "transition"] = id;
    _fadevars[$ "duration"] = _duration;
    _fadevars[$ "fades_out"] = _fadesout;
    instance_create_layer(0, 0, layer, _object, _fadevars);
}

perform = function() {
    create_fade(fadeout_object, fadeout_params, fadeout_duration, true);
}

on_fadeout = function() {
    if (!is_undefined(fadeout_action))
        fadeout_action();
    
    create_fadein();
}

create_fadein = function() {
    create_fade(fadein_object, fadein_params, fadein_duration, false);
}

on_fadein = function() {
    if (!is_undefined(fadein_action))
        fadein_action();
}
