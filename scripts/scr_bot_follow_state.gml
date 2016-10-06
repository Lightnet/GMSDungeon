///scr_enemy_chase_state

var dis = point_distance(x, y ,target.x, target.y);
if(dis > follow_distance){
    //show_debug_message("start follow");    
    var dir = point_direction(x,y,target.x,target.y);
    //show_debug_message(string(dir));    
    xaxis = lengthdir_x(1,dir);
    //show_debug_message(string(xaxis));
    yaxis = lengthdir_y(1,dir);
    scr_move_axis();
    //show_debug_message("follow");
}else{
    //show_debug_message("not follow");    
}
