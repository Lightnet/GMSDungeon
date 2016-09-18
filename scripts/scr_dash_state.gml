///scr_dash_state
movement = MOVE;
if(len == 0){
    dir = face * 90;
}

len = spd*4;

//get the hspd and vspd
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

//move
phy_position_x +=hspd;
phy_position_y +=vspd;

//create the dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
