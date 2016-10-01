///scr_save_map

if(!instance_exists(obj_level_generate_dungeon)) exit;

//create save data structure
var save_data = ds_map_create();

with(obj_level_generate_dungeon){
    //show_debug_message(string(grid));    
    save_data[? "grid"] = ds_grid_write(grid);
    save_data[? "grid_tileobjects"] = ds_grid_write(grid_tileobjects);    
    save_data[? "dungeonbjects"] = ds_grid_write(dungeonbjects);
    save_data[? "itemobjects"] = ds_grid_write(itemobjects);    
}

var save_string = json_encode(save_data);
ds_map_destroy(save_data);
//encode
//save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "tilemap.txt");
file_text_write_string(file, save_string);
file_text_close(file);
show_debug_message("save map!");
