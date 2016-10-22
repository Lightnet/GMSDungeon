//scr_set_path_follow(x,y);

var tx = argument0;
var ty = argument1;

var xx = (tx div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
var yy = (ty div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;

mp_grid_path(obj_level_generate_dungeon.grid_path, path, x, y, xx, yy, true);

//reset counter
point = 0;
path_done = 0;

//set state follow
state = scr_bot_follow_state;
//show_debug_message("set follow path?");
