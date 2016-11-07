///scr_npcChatCommands(str)
var str=argument[0];

var ex=false;

while(str!=""){
    if string_count("|",str)=0{break}
    var str2=string_copy(str,0,string_pos("|",str)-1);
    
    
    ///////////////////IF///////////////////
    if string_count("if ",string_copy(str2,1,2)){ ex=true
        str2=string_delete(str2,1,3)
        var scr=string_copy(str2,1,string_pos("(",str2)-1)
        var scr=asset_get_index(scr)
        //TEST
        for(aa=0;aa<5;aa++){arg[aa]=""}
        var _count=0;
        var str4=string_copy(str2,1,string_pos("{",str2)-1)
        str3=string_copy(str4,string_pos("(",str4)+1,string_pos(")",str4)-1)
        while(str3!=""){
            
            if string_count(",",str3)=0{
                arg[_count]=string(string_copy(str3,1,string_pos(")",str3)-1))
                str3=""
            }else{
                arg[_count]=string(string_copy(str3,1,string_pos(",",str3)-1))
                str3=string_delete(str3,1,string_pos(",",str3))
            }
            arg[_count]=string_replace_all(arg[_count],'"','')
            _count++
        }
        
        str2=string_delete(str2,1,string_pos("{",str2))
       
        var _r=0;
        _r=script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
        
        //DO
        if (_r)>0{
            str3=string_copy(str2,string_pos("{",str2)+1,string_pos("}",str2)-1)
            var scr=string_copy(str3,1,string_pos("(",str2)-1)
            var scr=asset_get_index(scr)
            
            if scr=-1{
                
                scr_npcDialogCommands("|"+str3+"|")
                
            }else{
            
                for(aa=0;aa<5;aa++){arg[aa]=""}
                _count=0
                str3=string_copy(str3,string_pos("(",str3)+1,string_pos(")",str3)-1)
                while(str3!=""){
                   if string_count(",",str3)=0{
                        arg[_count]=string_copy(str3,1,string_pos(")",str3)-1)
                        str3=""
                    }else{
                        arg[_count]=string_copy(str3,1,string_pos(",",str3)-1)
                        str3=string_delete(str3,1,string_pos(",",str3))
                    }
                    arg[_count]=string_replace_all(arg[_count],'"','')
                    _count++
                }
                
                script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
            }//else
        }
        str2=""
    }
    
    
    
    ///////////////////line(on0,on1)///////////////////
    if string_count("line(",str2){ ex=true
        str2=string_delete(str2,1,string_length("line("))
        var l0=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var l1=string_copy(str2,0,string_pos(")",str2)-1);
        on0=real(l0)-1
        on1=real(l1)
    }
    
    
    ///////////////////tele(x,y)///////////////////
    if string_count("teleNPC(",str2){ ex=true
        str2=string_delete(str2,1,string_length("teleNPC("))
        var xx=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var yy=string_copy(str2,0,string_pos(")",str2)-1);
        if string_count("*",xx){xx=real(string_replace_all(xx,"*",""))+x}
        if string_count("*",yy){yy=real(string_replace_all(yy,"*",""))+y}
        x=real(xx) y=real(yy)
    }
    
    ///////////////////telePlayer(x,y)///////////////////
    if string_count("telePlayer(",str2){ ex=true
        str2=string_delete(str2,1,string_length("tele("))
        var xx=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var yy=string_copy(str2,0,string_pos(")",str2)-1);
        if string_count("*",xx){xx=real(string_replace_all(xx,"*",""))+x}
        if string_count("*",yy){yy=real(string_replace_all(yy,"*",""))+y}
        objPlayer.x=real(xx) objPlayer.y=real(yy)
    }
    
    ///////////////////showChat///////////////////
    if string_count("showChat",str2){ ex=true
        showText2=false
    }
    
    ///////////////////quest(on0,on1)///////////////////
    if string_count("quest(",str2){ _did=true  ex=true
        str2=string_delete(str2,1,string_length("quest("))
        var _q=real(string_copy(str2,0,string_pos(",",str2)-1));
        var _o=real(string_replace(string_copy(str2,string_pos(",",str2)+1,string_pos(")",str2)-1),")",""));
        objControl.quest[_q]=_o
    }
    
    
    
    //General scripts-- ingame
    if  ex=false{
        var scr=string_copy(str2,1,string_pos("(",str2)-1)
        if scr!=""{
            var scr=asset_get_index(scr)
            if scr>-1{
                //get the arguments
                str3=string_copy(str2,string_pos("(",str2)+1,string_pos(")",str2)-1)
                var _count=0;
                arg[0]=0 arg[1]=0 arg[2]=0 arg[3]=0 arg[4]=0;
                while(str3!=""){
                    
                    if string_count(",",str3)=0{
                        arg[_count]=string(string_copy(str3,1,string_pos(")",str3)-1))
                        str3=""
                    }else{
                        arg[_count]=string(string_copy(str3,1,string_pos(",",str3)-1))
                        str3=string_delete(str3,1,string_pos(",",str3))
                    }
                    arg[_count]=string_replace_all(arg[_count],'"','')
                    _count++
                }
                //do the script
                script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
            }else{
                show_message("Unkown script: "+string(str2))
            }
        }
    }
    
    str=string_delete(str,1,string_pos("|",str))
}

