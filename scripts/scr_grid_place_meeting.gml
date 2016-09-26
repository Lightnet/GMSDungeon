//scr_grid_place_meetting(x,y)
var xx = argument[0];
var yy = argument[1];

// remember out position
var xp = x;
var yp = y;

//update the position bbox calculation
x = xx;
y = yy;

//check for meetting
var x_meeting = (obj_level.grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR) || 
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR);

//check for y meeting                
var y_meeting = (obj_level.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR) ||
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR);

var center_meeting = obj_level.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != FLOOR;
                                
// move back
x = xp;
y = yp;

//return either true or false
return x_meeting || y_meeting || center_meeting;
