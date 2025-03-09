/// @desc Setting up layer and room info
transition_layer = layer_create(transition_depth, "APIS_Transitions");

if (instance_exists(room_transition)) {
    room_transition.persistent = false;
    room_transition.create_fadein();
    room_transition = noone;
}

target_room = undefined;
if (leaving_room != room)
    previous_room = leaving_room;
