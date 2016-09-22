///select dungeon to display
var menu_index = argument0;
switch(menu_index){
    case 0:
        currentmenu = scr_status_menu;
        break;
    case 1:
        currentmenu = scr_creatures_menu;
        break;
    case 2:
        currentmenu = scr_abilities_menu;
        break;
    case 3:
        currentmenu = scr_research_menu;
        break;
    case 4:
        currentmenu = scr_items_menu;
        break;
    default:
        break;
}
