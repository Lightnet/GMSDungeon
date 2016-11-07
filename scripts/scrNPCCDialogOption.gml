///scrNPCChooseOption(i)

if !ds_exists(op0[on0,on1],ds_type_list){exit}
var op=argument[0];
var str=ds_list_find_value(op1[on0,on1],op);
if is_undefined(str){exit}
var _on0,_on1;
_on0=string_copy(str,0,string_pos(",",str)-1)
_on1=string_copy(str,string_pos(",",str)+1,string_pos("|",str)-1) str=string_delete(str,1,string_pos("|",str))
on0=real(_on0)
on1=real(_on1)
///////////////////////COMMANDS///////////////////////
scr_npcDialogCommands(str)

