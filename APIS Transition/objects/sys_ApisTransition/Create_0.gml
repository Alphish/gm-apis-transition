/// @description Setup

if (instance_number(sys_ApisTransition) > 1)
    throw ApisTransitionException.system_duplicate();

transition_layer = undefined;
