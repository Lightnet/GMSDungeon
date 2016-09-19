///scr_x_to_gx(x);
var xx = argument[0];
if(xx < obj_inventory.x) return -1;
return (xx - obj_inventory.x) div obj_inventory.box_size;
