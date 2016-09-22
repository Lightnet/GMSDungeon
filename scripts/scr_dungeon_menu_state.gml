///input state
if(alarm[0] <= 0){
    if(obj_input.right_key){
        if(menu_index < array_length_1d(option)-1){
            menu_index++;
        }else{
            menu_index = 0;
        }
        scr_dungeon_menu_select(menu_index);
        alarm[0] = room_speed/6;
    }

    if(obj_input.left_key){
        if(menu_index > 0){
            menu_index--;
        }else{
            menu_index = array_length_1d(option)-1;
        }
        scr_dungeon_menu_select(menu_index);        
        alarm[0] = room_speed/6;
    }
    
    
    if(obj_input.dash_key){
        switch(menu_index){
            case 0:
                current_state = scr_status_menu_state;
                break;
            case 1:
                current_state = scr_creatures_menu_state;
                break;
            case 2:
                current_state = scr_abilities_menu_state;
                break;
            case 3:
                current_state = scr_research_menu_state;
                break;
            case 4:
                current_state = scr_items_menu_state;
                break;
            default:
                break;
        }
        obj_input.dash_key = false;
    }
    
}
