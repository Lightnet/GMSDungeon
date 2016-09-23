///dungeon key inputs

if(obj_input.camtoggle_key){
    if(toggle_camera){
        toggle_camera = false;
        if(instance_exists(obj_view)){
            with(obj_view){
                bcameracontrol = false;
                bfollowplayer = true;
                global._display_player = CONTROL_PLAYER;
            }
        }
    }else{
        toggle_camera = true;
        if(instance_exists(obj_view)){
            with(obj_view){
                bcameracontrol = true;
                bfollowplayer = false;
                global._display_player = CONTROL_DUNGEON;                
            }
        }
    }
}

if(obj_input.buildmenu_key){
    if(instance_exists(obj_build_menu)){
        if(obj_build_menu.isbuild){
            obj_build_menu.isbuild = false;
        }else{
            obj_build_menu.isbuild = true;
        }
    }
}
