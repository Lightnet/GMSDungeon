///scr_save_map

if(!instance_exists(obj_level_generate_dungeon)) exit;

//create save data structure
var save_data = ds_map_create();
save_data[? "name"] = "none";
save_data[? "version"] = "0.1";
save_data[? "date"] = string(current_day) + "/" + string (current_month) + "/" + string(current_year);


//set the grid and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

save_data[? "width"] = width;
save_data[? "height"] = height;

with(obj_level_generate_dungeon){
    //===============================================
    //show_debug_message(string(grid));
    //save_data[? "obj"] = ds_grid_write(obj_data);
    save_data[? "grid"] = ds_grid_write(grid);
    //===============================================
    //save_data[? "grid_tileobjects"] = ds_grid_write(grid_tileobjects);
    var obj_tiles = ds_grid_create(width, height);
    for(var yy = 0; yy < height; yy++){
        for(var xx = 0; xx < width; xx++){
            if(grid_tileobjects[# xx, yy]){
                var objt = ds_map_create();
                var _obj = grid_tileobjects[# xx, yy];
                objt[? "object_index"] = _obj.object_index;
                //objt[? "x"] = _obj.x;
                //objt[? "y"] = _obj.y;
                obj_tiles[# xx, yy] = json_encode(objt);
                ds_map_destroy(objt);
            }
        }
    }
    save_data[? "grid_tileobjects"] = ds_grid_write(obj_tiles);
    ds_grid_destroy(obj_tiles);
    //ds_map_destroy(tiles);
    //===============================================
    //save_data[? "grid_trapobjects"] = ds_grid_write(grid_trapobjects);
    var obj_traps = ds_grid_create(width, height);
    
    for(var yy = 0; yy < height; yy++){
        for(var xx = 0; xx < width; xx++){
            if(grid_trapobjects[# xx, yy]){
                var objt = ds_map_create();
                var _obj = grid_trapobjects[# xx, yy];
                objt[? "object_index"] = _obj.object_index;
                //objt[? "x"] = _obj.x;
                //objt[? "y"] = _obj.y;
                obj_traps[# xx, yy] = json_encode(objt);
                ds_map_destroy(objt);
                show_debug_message("found trap!");
            }else{
                var objt2 = ds_map_create();
                objt2[? "object_index"] = -1;
                obj_traps[# xx, yy] = json_encode(objt2);
                ds_map_destroy(objt2);
                //show_debug_message("noone:"+ string(noone));
            }
        }
    }
    save_data[? "grid_trapobjects"] = ds_grid_write(obj_traps);
    ds_grid_destroy(obj_traps);
    //===============================================
    // object dungeons map
    //===============================================
    /*
    var obj_dungeons = ds_map_create();
    var count = 0;
    for(var i = 0; i < ds_list_size(dungeonbjects); i++){
        var val = ds_list_find_value(dungeonbjects, i);
        var objt = ds_map_create();
        objt[? "object_index"] = val.object_index;
        objt[? "x"] = val.x;
        objt[? "y"] = val.y;
        //show_debug_message("objd");
        //show_debug_message(objt);
        obj_dungeons[? i] = json_encode(objt);
        //ds_map_add(obj_dungeons,json_encode(objt));
        //count++;
    }
    show_debug_message("dungeon objects"+string(ds_map_size(obj_dungeons)));
    save_data[? "dungeonobjects"] = ds_map_write(obj_dungeons);
    ds_map_destroy(obj_dungeons);
    */
    //save_data[? "itemobjects"] = ds_grid_write(itemobjects);
    //===============================================
    // dungeon objects list
    //===============================================
    var _dungeon_objects = ds_list_create();
    for(var i = 0; i < ds_list_size(dungeonbjects); i++){
        var val = ds_list_find_value(dungeonbjects, i);
        var objt = ds_map_create();
        objt[? "object_index"] = val.object_index;
        objt[? "x"] = val.x;
        objt[? "y"] = val.y;
        ds_list_add(_dungeon_objects,json_encode(objt));
        ds_map_destroy(objt);
    }
    //show_debug_message("dungeon objects"+string(ds_list_size(_dungeon_objects)));
    save_data[? "dungeon_objects"] = ds_list_write(_dungeon_objects);
    ds_list_destroy(_dungeon_objects);
    
    //===============================================
    // item objects list
    //===============================================
    var _item_objects = ds_list_create();
    for(var i = 0; i < ds_list_size(itemobjects); i++){
        var val = ds_list_find_value(itemobjects, i);
        var objt = ds_map_create();
        objt[? "object_index"] = val.object_index;
        objt[? "x"] = val.x;
        objt[? "y"] = val.y;
        ds_list_add(_item_objects,json_encode(objt));
        ds_map_destroy(objt);
    }
    //show_debug_message("dungeon objects"+string(ds_list_size(_dungeon_objects)));
    save_data[? "item_objects"] = ds_list_write(_item_objects);
    ds_list_destroy(_item_objects);
       
}

//===============================================
//obj creatures

var obj_creatures = ds_map_create();
var count = 0;
with(obj_lifeform_parent){
    show_debug_message("obj_creatures"+string(count));
    
    var objt = ds_map_create();
    objt[? "object_index"] = object_index;
    objt[? "x"] = x;
    objt[? "y"] = y;
    obj_creatures[? count] = json_encode(objt);
    ds_map_destroy(objt);
    count++;
}
save_data[? "obj_creatures"] = ds_map_write(obj_creatures);
ds_map_destroy(obj_creatures);

//save_data[? "line"] = "line";//testing where the file line end



/*
//list objects
var objlist = ds_map_create();
//create ds map
var obj_data = ds_map_create();
obj_data[? "name"] = "test";
obj_data[? "x"] = 1;
obj_data[? "y"] = 2;
objlist[? 0] = json_encode(obj_data);
obj_data[? "name"] = "test1";
obj_data[? "x"] = 0;
obj_data[? "y"] = 0;
objlist[? 1] = json_encode(obj_data);
save_data[? "obj"] = ds_map_write(objlist);
show_debug_message(string(save_data[? "obj"]));

//delete ds map
ds_map_destroy(obj_data);
*/

//ds_list_destroy(objlist);

//var count = instance_count(obj_wall);

//with(obj_level_generate_dungeon){
    //show_debug_message(string(grid));
    //save_data[? "obj"] = ds_grid_write(obj_data);
    //save_data[? "grid"] = ds_grid_write(grid);
    //save_data[? "grid_tileobjects"] = ds_grid_write(grid_tileobjects);    
    //save_data[? "dungeonbjects"] = ds_grid_write(dungeonbjects);
    //save_data[? "itemobjects"] = ds_grid_write(itemobjects);    
//}

var save_string = json_encode(save_data);
ds_map_destroy(save_data);
//encode
save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "tilemap.txt");
file_text_write_string(file, save_string);
file_text_close(file);


show_debug_message("save map!");
