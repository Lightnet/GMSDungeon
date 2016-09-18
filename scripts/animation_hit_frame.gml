///animation_hit_frame(frame)
//var frame = argument[0];
var frame = argument0;
//show_debug_message(frame);
return (image_index >= frame + 1 - image_speed) && (image_index < frame + 1);
