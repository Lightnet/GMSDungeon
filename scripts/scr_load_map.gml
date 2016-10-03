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
show_debug_message(save_data[? "date"]);

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
//===============================================
// object Tiles
//===============================================
var grid_tileobjects = ds_grid_create(width, height);
ds_grid_read(grid_tileobjects, save_data[? "grid_tileobjects"]);

for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        //if(grid_tileobjects[# xx, yy] > 0){//make sure it plus else negtive mean noone
            var _obj = json_decode(grid_tileobjects[# xx, yy]);
            if(_obj[? "object_index"] > 0){//check if object index is not negtive
                instance_create(xx*CELL_WIDTH,yy*CELL_HEIGHT,_obj[? "object_index"]);
                //show_debug_message(string(_obj[? "object_index"]));
            }
            //show_debug_message("create");
        //}
    }
}
ds_grid_destroy(grid_tileobjects);
//===============================================
//object Traps
//===============================================
var grid_trapobjects = ds_grid_create(width, height);
ds_grid_read(grid_trapobjects, save_data[? "grid_trapobjects"]);

for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        //if(grid_tileobjects[# xx, yy] > 0){//make sure it plus else negtive mean noone
            var _obj = json_decode(grid_trapobjects[# xx, yy]);
            if(_obj[? "object_index"] > 0){//check if object index is not negtive
                //
                instance_create(xx*CELL_WIDTH,yy*CELL_HEIGHT,_obj[? "object_index"]);
                show_debug_message(string(_obj[? "object_index"]));
            }
            _obj = noone;
            //show_debug_message("create");
        //}
    }
}
ds_grid_destroy(grid_trapobjects);

//===============================================
//object dungeon map
//===============================================
/*
var obj_dungeons = ds_map_create();
ds_map_read(obj_dungeons, save_data[? "dungeonobjects"]);
//show_debug_message("dungeon objects"+string(ds_map_size(obj_dungeons)));
for(var i = 0; i < ds_map_size(obj_dungeons); i++){
    //show_debug_message(string(obj_dungeons[? i]));
    var _obj_d = json_decode(obj_dungeons[? i]);
    //show_debug_message( string(_obj_d[? "object_index"]));
    instance_create(_obj_d[? "x"],_obj_d[? "y"],_obj_d[? "object_index"]);
}
ds_map_destroy(obj_dungeons);
*/
//show_debug_message("end dungeon objects");

//===============================================
//dungeon objects list
//===============================================
var _dungeon_objects = ds_list_create();
ds_list_read(_dungeon_objects, save_data[? "dungeon_objects"]);
show_debug_message("LEN:"+string(ds_list_size(_dungeon_objects)));
for(var i = 0; i < ds_list_size(_dungeon_objects);i++){
    var val = ds_list_find_value(_dungeon_objects,i);
    var _obj = json_decode(val);
    //show_debug_message(val);
    //show_debug_message(_obj[? "x"]);
    instance_create(_obj[? "x"],_obj[? "y"],_obj[? "object_index"]);
}







//===============================================
//object creatures
//===============================================

var obj_creatures = ds_map_create();
ds_map_read(obj_creatures, save_data[? "obj_creatures"]);
show_debug_message(string(ds_map_size(obj_creatures)));
for(var i = 0; i < ds_map_size(obj_creatures);i++){
    var _creature = json_decode(obj_creatures[? i]);
    instance_create(_creature[? "x"],_creature[? "y"],_creature[? "object_index"]);
    show_debug_message("entitly creature");
}











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
