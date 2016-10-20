///scr_get_path_to_bot()

//if(instance_exists(obj_player_box)){
    var xx = (tx div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
    var yy = (ty div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;
    //show_debug_message("x:"+ string(x) +"y:" +string(y));
    
    if(mp_grid_path(obj_level_generate_dungeon.grid_path, path, x, y, xx, yy, true)){
        //path_start(path, 1, path_action_stop, false);
        //show_debug_message(path_get_length(path));
        //show_debug_message("stop pathing??");
        //exit;
        //bfollow = false;
    }
    //show_debug_message("pathing??");
//}
