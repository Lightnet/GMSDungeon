///scr_load_map()

var file = file_text_open_read(working_directory + "tilemap.txt");
show_debug_message("check load map?");
//show_debug_message(string(file));
if (file == -1) exit;

var save_string = file_text_read_string(file);
file_text_close(file);
//show_debug_message(save_string);
var save_data = json_decode(save_string);

show_debug_message(save_data[? "name"]);
show_debug_message(save_data[? "version"]);

//set the grid and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

//FLOOR and WALL
var grid = ds_grid_create(width,height);
ds_grid_read(grid,save_data[? "grid"]);

for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(grid[# xx, yy] == FLOOR){
            //show_debug_message("found floor!");        
        }
    }
}



//tile object
var grid_tileobjects = ds_map_create();
ds_map_read(grid_tileobjects,save_data[? "grid_tileobjects"]);
for(var i = 0; i < ds_map_size(grid_tileobjects); i++){
    var obj_l = json_decode(grid_tileobjects[? i]);
    show_debug_message(  string(obj_l[? "x"]) + ":" + string(obj_l[? "y"]));
    instance_create(obj_l[? "x"],obj_l[? "y"],obj_l[? "object_index"]);
}





//for(var yy = 0; yy < height; yy++){
    //for(var xx = 0; xx < width; xx++){
        //show_debug_message(string(grid[# xx, yy]));
        //show_debug_message(string(grid[# xx, yy].x));
        //var obj_l = grid_tileobjects[]
        //show_debug_message(string( grid_tileobjects[# xx, yy].x) + ":" +string( grid[# xx, yy].y));
        //instance_create(grid[# xx, yy].x,grid[# xx, yy].y,grid[# xx, yy].object_index);
        //if(grid[# xx, yy] == FLOOR){
            //show_debug_message("found floor!");        
        //}
    //}
//}


/*
var obj_data = ds_map_create();
ds_map_read(obj_data, save_data[? "obj"]);
show_debug_message("size");
show_debug_message( string(obj_data[? 1]));
var test_ = json_decode(obj_data[? 0])
show_debug_message( test_[? "y"]);
show_debug_message("ARRAY LIST OBJ:");
for(var i =0;i < ds_map_size(obj_data);i++){
//    show_debug_message( string(json_decode(obj_data[? 0])))
    var test_ = json_decode(obj_data[? i]);
    show_debug_message( test_[? "y"]);
}
//delete ds map
ds_map_destroy(obj_data);
*/














//show_debug_message( obj_data[? "x"]);
//show_debug_message( ds_map_find_value(obj_data,"x"));

//var obj_data = ds_map_create();
//var obj_ = save_data[? "obj"];
//ds_grid_read(obj_data,);
//show_debug_message(obj_data[? "x"]);












/*
//save_string = base64_decode(save_string);
var save_data = json_decode(save_string);

var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;
var grid = ds_grid_create(width, height);


var map_tile = save_data[? "grid"];
ds_grid_read(grid, map_tile);

for(var yy = 1;yy < height - 1;yy++){
    for(var xx = 1;xx < width - 1;xx++){
        if(grid[# xx,yy] == FLOOR){
            //show_debug_message("FLOOR FOUND?");                
        }
        if(grid[# xx,yy] == WALL){

        }
    }
}
*/
show_debug_message("load map?");
/*
var save_room = save_data[? "room"];
if(room != save_room){
    room_goto(save_room);
}
*/

/*
with (obj_player_stats){
    player_xstart = save_data[? "x"];
    player_ystart = save_data[? "y"];
    if(instance_exists(obj_player)){
        obj_player.x = player_xstart;
        obj_player.y = player_ystart;
        obj_player.phy_position_x = player_xstart;
        obj_player.phy_position_y = player_ystart;        
    } else {
        instance_create(player_xstart,player_ystart, obj_player);
        hp = save_data[? "hp"];
        maxhp = save_data[? "maxhp"];
        stamina = save_data[? "stamina"];
        maxstamina = save_data[? "maxstamina"];
        expr = save_data[? "expr"];
        maxexpr = save_data[? "maxexpr"];
        level = save_data[? "level"];
        attack = save_data[? "attack"];
    }
}
*/
ds_map_destroy(save_data);
