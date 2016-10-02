///scr_save_map

if(!instance_exists(obj_level_generate_dungeon)) exit;

//create save data structure
var save_data = ds_map_create();
save_data[? "name"] = "none";
save_data[? "version"] = "0.1";
save_data[? ""] = "0.1";


//list objects
var objlist = ds_map_create();
//create ds map
var obj_data = ds_map_create();
obj_data[? "name"] = "test";
obj_data[? "x"] = 1;
obj_data[? "y"] = 2;

//show_debug_message(json_encode(obj_data));

objlist[? 0] = json_encode(obj_data);
obj_data[? "name"] = "test1";
obj_data[? "x"] = 0;
obj_data[? "y"] = 0;
objlist[? 1] = json_encode(obj_data);



//objlist[? 0] = "test";
//objlist[? 1] = "test1";


//show_debug_message(ds_list_size(objlist));

//show_debug_message('test list:'+string(array_length_1d(objlist)));
//for(var i = 0; i < array_length_1d(objlist);i++){
//    show_debug_message("test?");
//    show_debug_message(objlist[i]);
//}

//show_debug_message(json_encode(objlist));


//show_debug_message(ds_grid_write(obj_data));
//save_data[? "obj"] = json_encode(objlist);
save_data[? "obj"] = ds_map_write(objlist);
show_debug_message(string(save_data[? "obj"]));

//delete ds map
ds_map_destroy(obj_data);
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
//save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "tilemap.txt");
file_text_write_string(file, save_string);
file_text_close(file);
show_debug_message("save map!");
