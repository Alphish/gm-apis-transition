if (!instance_exists(transition))
    throw ApisTransitionException.transition_not_linked();

fade_time = 0;
fade_factor = fades_out ? 0 : 1;
