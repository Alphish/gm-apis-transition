if (fade_time == duration) {
    if (fades_out)
        transition.on_fadeout();
    else
        transition.on_fadein();
    
    instance_destroy();
    return;
}

fade_time = min(fade_time + 1, duration);

var _time_factor = fade_time / duration;
fade_factor = fades_out ? _time_factor : 1 - _time_factor;
