/// @description Setup

if (instance_number(sys_ApisTransition) > 1)
    throw ApisTransitionException.system_duplicate();

transition_layer = undefined;

// only one between-room transition can be performed at a time
// so room-related information is stored on the shared transition system object
room_transition = noone;
previous_room = undefined;
leaving_room = undefined;
target_room = undefined;
carryover_data = undefined;

leave_to = function(_room, _transition) {
    if (instance_exists(room_transition))
        throw ApisTransitionException.multiple_room_transitions(target_room, _room);
    
    room_transition = _transition;
    room_transition.persistent = true;
    target_room = _room;
}

change_room = function() {
    if (target_room == room)
        room_restart();
    else
        room_goto(target_room);
}
