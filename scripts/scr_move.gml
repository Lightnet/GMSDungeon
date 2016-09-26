var hspd = argument[0];
var vspd = argument[1];

// horizontal collision
if(scr_grid_place_meeting(x+hspd,y)){
    while(!scr_grid_place_meeting(x+sign(hspd),y)){
        x+=sign(hspd);
    }
    hspd=0;
}

//horizontal vertically
x+=hspd;

// vertical collision
// horizontal collision
if(scr_grid_place_meeting(x,y+vspd)){
    while(!scr_grid_place_meeting(x,y+sign(vspd))){
        y+=sign(vspd);
    }
    vspd=0;
}

//move vertically
y+=vspd;
