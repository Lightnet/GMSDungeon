///scr_inventory_add_item
var xx = argument[0];
var yy = argument[1];
var add_item = argument[2];

if(xx != median(0,xx,obj_inventory.width-1) || yy != median(0,yy,obj_inventory.height-1)){
    show_debug_message("The x and y are outside of the range!");
    exit;
}

//get the item count
var item_count = obj_inventory.count[# xx,yy];

if(item_count == 0){
    //add the item
    obj_inventory.box[# xx,yy] = add_item;
    
    //add 1 to the count
    obj_inventory.count[# xx,yy]++;
    
    //return back out
    return true;
    
} else if(item_count > 0){
    //there is already an item here
    //is the item are adding the same?
    if(obj_inventory.box[# xx,yy] == item_count){
        //add 1 to the count
        obj_inventory.count[# xx,yy]++;
        //return back out
        return true;
    }else{
        show_debug_message("There is already and item there.");
        return false;
    }
}else{
    //our item count is less than zero
    //Error
    show_error("The item count is less than 0",false);
}
