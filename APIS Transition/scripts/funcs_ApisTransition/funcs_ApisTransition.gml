function apis_transition_perform(_transition, _params = undefined) {
    var _instance = !is_undefined(_params)
        ? instance_create_layer(0, 0, "Instances", _transition, _params)
        : instance_create_layer(0, 0, "Instances", _transition);
    _instance.perform();
    return _instance;
}
