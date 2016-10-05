 ///scr_level_generate_dungeon()

/// initialize dungeon create
global.level_generate = true;
//check level generate dungeon
if(global.level_generate){
    // resize room
    room_width = (CELL_WIDTH/16) * 720;
    room_height = (CELL_HEIGHT/16) * 720;
    
    //set the grid and height
    var width = room_width div CELL_WIDTH;
    var height = room_height div CELL_HEIGHT;
    
    //create the grid FLOOR,WALL,VOID
    grid = ds_grid_create(width, height);
    
    //create pathfinding grid
    grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);
    
    //create object grid instance object
    grid_tileobjects = ds_grid_create(width, height);
    
    //this place traps grid base
    grid_trapobjects = ds_grid_create(width, height);
    ds_grid_set_region(grid_trapobjects, 0, 0, width - 1, height - 1, noone);
    //place item objects place in dungeon
    dungeonbjects = ds_list_create();    
    //place item objects loot item
    itemobjects = ds_list_create();
    //show_debug_message("dasdasdasdasd");
    //ds_list_add(objectplaces,"test");
    //ds_list_add(objectplaces,"tests");
    //show_debug_message(string(array_length_1d(objectplaces)));
        
    //show_debug_message("Place obj?");
    //show_debug_message(string(grid_placeobjects));
    
    //fill the grid with the void
    ds_grid_set_region(grid, 0, 0, width - 1, height - 1, WALL);
    
    // randomize the world
    randomize();
    
    //create the controller in the center of the grid
    var cx = width div 2;
    var cy = height div 2;
    
    //create the player
    //instance_create((cx*CELL_WIDTH)+(CELL_WIDTH/2),(cy*CELL_HEIGHT)+(CELL_HEIGHT/2), obj_dungeon_core);
    //instance_create((cx*CELL_WIDTH),(cy*CELL_HEIGHT), obj_dungeon_core);
    
    //floor
    grid[# cx, cy] = FLOOR; //center 
    grid[# cx-1, cy] = FLOOR; //left
    grid[# cx-1, cy-1] = FLOOR;//left top
    grid[# cx, cy-1] = FLOOR; //top
    grid[# cx+1, cy-1] = FLOOR;//top right
    grid[# cx+1, cy] = FLOOR;//right
    grid[# cx+1, cy+1] = FLOOR;//bottom right
    grid[# cx, cy+1] = FLOOR;//bottom
    grid[# cx-1, cy+1] = FLOOR;//bottom left
    
    //create instance object.
    for(var yy = 1;yy < height - 1;yy++){
        for(var xx = 1;xx < width - 1;xx++){
            if(grid[# xx,yy] == FLOOR){
                var _floor = instance_create(xx*CELL_WIDTH,yy*CELL_WIDTH, obj_floor);
                grid_tileobjects[# xx, yy] = _floor;
            }else{
                //mp_grid_add_cell(grid_path, xx, yy);
            }
            if(grid[# xx,yy] == WALL){
                var _wall = instance_create(xx*CELL_WIDTH,yy*CELL_WIDTH, obj_wall);
                grid_tileobjects[# xx, yy] = _wall;            
            }
        }
    }
    //show_debug_message(string(grid));
}

