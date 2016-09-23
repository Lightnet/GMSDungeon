///input state
if(alarm[0] <= 0){
    if(obj_input.swap_key){
        show_debug_message("back?scr_abilitiesmenu_state");
        current_state = scr_dungeon_menu_state;
    }
}
