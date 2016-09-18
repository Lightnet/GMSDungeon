///Initialise

//===== Define gmCallback scripts

var success;
success = 0;

if(callback_define_script("lines_add",lines_add("")))       {success += 1;}
if(callback_define_script("lines_clear",lines_clear()))     {success += 1;}

if(success < 2)
{
    //One or more scripts failed to initialise.
    //If this does happen, the likely cause is a browser incompatible with gmCallback.
    
    //Note:
    // - gmCallback has been tested with most major browsers to ensure compatability.
    //   However it's still good practice to ensure that initialisation was successful.
}


//===== Initialise output display
draw_set_font(fnt_text);
draw_set_color(c_white);
//draw_y = room_height-8;
draw_y = display_get_gui_height()-8;
display = ">> gmCallback Example#>> By JacksonYarr#>>";
