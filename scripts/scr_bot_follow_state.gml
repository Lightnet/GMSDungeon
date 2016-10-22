///scr_enemy_chase_state

//if(instance_exists(target)){
    //path_get_number(target.path);
    if(!path_done) {
        //show_debug_message(path_get_number(target.path));
        dir = point_direction(x,y,path_get_point_x(path,point),path_get_point_y(path,point));
        /* Change this if necessary */
        if(point_distance(x,y,path_get_point_x(path,point),path_get_point_y(path,point)) < 10 ) {
            point++;
            if(point >= path_get_number(path)) {
                path_done = true;
                //show_debug_message("done??");
                state = scr_bot_idle_state;
            }
        }else{        
            xaxis = lengthdir_x(1,dir);
            yaxis = lengthdir_y(1,dir);
            scr_move_axis();
        }
    }
//}


/*
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
*/
