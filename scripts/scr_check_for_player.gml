///scr_check_for_player
if(instance_exists(obj_player)){
    var dis = point_distance(x, y ,obj_player.x, obj_player.y);
    if(dis < sight){
        state = scr_bot_chase_state;
        var dir = point_direction(x,y,obj_player.x,obj_player.y);
        xaxis = lengthdir_x(1,dir);
        yaxis = lengthdir_y(1,dir);
    }else{
        scr_bot_chose_next_state();
    }
} else {
    scr_bot_chose_next_state();
}
