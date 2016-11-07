///scr_changeQuest(questID,questStep)

/*
    typically you could just do objControl.quest[questID]=questStep
    but, that would not jump to the next dialogue tree on its own
    
    so, that is what this script does
*/

objControl.quest[argument[0]]=argument[1]

//set the text based off the config we just loaded
for(var i=0;i<checkAmount;i++){
    if objControl.quest[checkQuest[i]]=checkON[i]{
        on0=checkText0[i]
        on1=checkText1[i]
    }
}
