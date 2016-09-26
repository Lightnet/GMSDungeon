///scr_get_path_to_player()
if(instance_exists(obj_player_box)){
    var xx = (obj_player_box.x div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
    var yy = (obj_player_box.y div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;
    
    if(mp_grid_path(obj_level.grid_path, path, x, y, xx, yy, true)){
        path_start(path, 2, path_action_stop, false);
    }
}
