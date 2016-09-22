///input state
if(alarm[0] <= 0){
    if(obj_input.swap_key){
        current_state = scr_dungeon_menu_state;
    }
    if(obj_input.down_key){
        if(status_index < array_length_1d(status)-1){
            status_index++;
        }else{
            status_index = 0;
        }
        alarm[0] = room_speed/6;
    }
    if(obj_input.up_key){
        if(status_index > 0){
            status_index--;
        }else{
            status_index = array_length_1d(status)-1;
        }      
        alarm[0] = room_speed/6;
    }
}
