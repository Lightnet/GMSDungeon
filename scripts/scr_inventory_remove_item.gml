///scr_inventory_remove_item(x, y)
var xx = argument[0];
var yy = argument[1];

if(xx != median(0,xx,obj_inventory.width-1) || yy != median(0,yy,obj_inventory.height-1)){
    show_debug_message("The x and y are outside of the range!");
    exit;
}

//get the item count
var item_count = obj_inventory.count[# xx,yy];

//make sure we have items

if(item_count > 0){
    //take 1 from item count
    obj_inventory.count[# xx,yy]--;
    
    //get access to remove item
    var remove_item = obj_inventory.box[# xx,yy];
    
    //check for last item
    if(item_count == 1){
        //set item box to empty
        obj_inventory.box[# xx,yy] = item.none;
    }
    
    // return item removed
    return remove_item;
    
}else if(item_count == 0){
    show_debug_message("There was not an item at that location.");
    return item.none;
}else{
    //Error
    show_error("The item count is less than 0",false);
}
