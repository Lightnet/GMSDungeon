///build menu
if(isbuild){
    isboundbox = false;
    var xx = display_get_gui_width()/2;
    var yy = display_get_gui_height()/2;
    draw_text(xx,16,"BUILD MODE");
    //draw text h menu
    for (var i = 0; i < array_length_1d(buildmenu); i++)
    {
        draw_text(xx+(i*80)-128, 64, string(buildmenu[i]));
    }
    
    var screenx = device_mouse_x_to_gui(0);
    var screeny = device_mouse_y_to_gui(0); 
    //check if icon are bound here min and max
    //if(screeny > (4 + yy -64) and screeny < (5*(32+4) + yy -64)){//size and offsets and items
    //if(screenx > 4 and screenx < (32+4) and screeny > 4 and screeny < (5*(32+4))){//size and offsets
    if(screenx > 4 and screenx < (32+4) and screeny > (4 + yy -64) and screeny < (5*(32+4) + yy -64)){
        //show_debug_message("in bound?");
        isboundbox = true;
        //need to add icon select here to build the dungeon
    }else{
        //show_debug_message("out bound?");   
    }
    
    if(keyboard_check(ord('S'))){
        list_index++;
        show_debug_message(string(list_index));        
    }
    if(keyboard_check(ord('D'))){
        list_index--;
        show_debug_message(string(list_index));
    }    
    // draw icons
    list_count = 0;
    if(list_index <= 0){
        list_index = 0;
    }
    //check if array list max list to not move
    if(array_length_1d(slotlist) <= list_max){
        list_index = 0;
    }else{
        if(list_index > array_length_1d(slotlist) - list_max){
            list_index = array_length_1d(slotlist) - list_max;
        }
    }
    
    for (i = list_index; i < array_length_1d(slotlist); i++){    
        if(list_count >= list_max){
            break;
        }
        draw_text(48,yy+((32+4)*list_count)-64,slotlist[i]);        
        draw_sprite(spr_slot,0,4,yy+((32+4)*list_count)-64);
        list_count++;
    }
    
    //add bool check if need to snap to grid or not
    
    //place preview
    if(instance_exists(obj_placer)){
        obj_placer.visible = true;
        //divide and floor and time
        obj_placer.x = (mouse_x div sizegrid)*32;
        obj_placer.y = (mouse_y div sizegrid)*32;
    }
    
    //place object
    if(mouse_check_button_pressed(mb_left) == true and isboundbox = false ){
        instance_create((mouse_x div sizegrid)*32,(mouse_y div sizegrid)*32,selectobject);
    }
}else{
    if(instance_exists(obj_placer)){
        with(obj_placer){
            visible = false;
        }
    }
}
