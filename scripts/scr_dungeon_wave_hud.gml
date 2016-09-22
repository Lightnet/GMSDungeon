var xx = display_get_gui_width()/2;
var yy = display_get_gui_height()/2;

draw_text(192,16, "Creatures: " + string(creature_count) + "/" + string(creature_maxcount));
draw_text(192,32, "Spawn: " + string(bstop_spawn) );

var wavecount = 0;
if(wave_count >= creature_maxcount){
    wavecount = wave_maxcount;
}else{
    wavecount = wave_count;
}
draw_text(192,48, "Wave Count: " + string(wavecount)+"/"+string(wave_maxcount) );
draw_text(192,64, "Killed: " + string(creature_deathcount) + "/" + string(creature_maxcount));
draw_text(192,80, "start wave?: " +string(alarm[1]));
