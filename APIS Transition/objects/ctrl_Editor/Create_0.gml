collect_tile_data = function() {
    var _minx = room_width;
    var _maxx = 0;
    var _miny = room_height;
    with (obj_EditorTile) {
        _minx = min(x, _minx);
        _maxx = max(x, _maxx);
        _miny = min(y, _miny);
    }
    var _width = ((_maxx - _minx) div 64) + 1;
    
    var _grid = array_create(instance_number(obj_EditorTile), undefined);
    with (obj_EditorTile) {
        var _cx = (x - _minx) div 64;
        var _cy = (y - _miny) div 64;
        _grid[_cy * _width + _cx] = image_index;
    }
    
    return _grid;
}

place_tile_data = function(_grid) {
    var _minx = room_width;
    var _maxx = 0;
    var _miny = room_height;
    with (obj_EditorTile) {
        _minx = min(x, _minx);
        _maxx = max(x, _maxx);
        _miny = min(y, _miny);
    }
    var _width = ((_maxx - _minx) div 64) + 1;
    
    with (obj_EditorTile) {
        var _cx = (x - _minx) div 64;
        var _cy = (y - _miny) div 64;
        image_index = _grid[_cy * _width + _cx];
    }
    
    return _grid;
}

goto_other_room = function() {
    var _grid = collect_tile_data();
    apis_transition_goto_room(other_room, undefined, undefined, _grid);
}
