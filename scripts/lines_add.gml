//===== gmCallback

if(!callback_script("lines_add",1))
{exit;}

//Note: 
// - The above needs to be called before anything else in the script.
// - The script should always exit if 'callback_script()' returns false.
// - Remember to ensure the number of arguments is always set correctly.


//===== Output to display

obj_console.display += "#>> "+string(argument0);
//show_debug_message("hello add lines?");
return true;
