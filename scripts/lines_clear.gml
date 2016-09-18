//===== gmCallback

if(!callback_script("lines_clear",0))
{exit;}

//Note: 
// - The above needs to be called before anything else in the script.
// - The script should always exit if 'callback_script()' returns false.
// - Remember to ensure the number of arguments is always set correctly.


//===== Clear display

obj_console.display = ">> gmCallback Example#>> By JacksonYarr#>>";
//show_debug_message("test clear lines?");
return true;
