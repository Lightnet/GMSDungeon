///scr_get_path_to_bot()

//if(instance_exists(obj_player_box)){
    var xx = (target_x div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
    var yy = (target_y div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;
    show_debug_message("x:"+ string(x) +"y:" +string(y));
    
    if(mp_grid_path(obj_level_generate_dungeon.grid_path, path, x, y, xx, yy, true)){
        path_start(path, 2, path_action_stop, false);
        show_debug_message("stop pathing??");
        //exit;
    }
    //show_debug_message("pathing??");
//}
