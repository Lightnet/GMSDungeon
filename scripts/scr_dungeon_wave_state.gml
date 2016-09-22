//spawn number of creature for the one wave at the time
if(creature_count >= creature_maxcount and bstop_spawn == false){
    //stop summon ceatures
    if(instance_exists(obj_spawner)){
        with(obj_spawner){//loop all object room matching this?
            bspawn = false;
        }
    }
    show_debug_message("Max ceatures reached. Stopping summon creatures!");
    bstop_spawn = true;
}
//need to clean up
//check monster death and wave next start
if(creature_deathcount >= creature_maxcount){
    show_debug_message("starting next wave!");
    bstop_spawn = true;
    creature_deathcount = 0;
    creature_count = 0;
    wave_count++;
    if(wave_count == wave_maxcount){
        bfinish_wave = true;
    }
    start_next_wave = true;
    alarm[1] = room_speed * next_wave_time;
}

if(alarm[1] <= 0 || bfinish_wave == true){
    if(start_next_wave){
        if(instance_exists(obj_spawner)){
            with(obj_spawner){
                bspawn = true;
            }
        }
        //check for win condtions
        if(wave_count > wave_maxcount -1){
            show_debug_message("All Wave Are Finished...");
            with(obj_spawner){
                bspawn = false;
            }
        }
        bstop_spawn = false;
        //show_debug_message("start wave?");
        start_next_wave = false;
    }
}
