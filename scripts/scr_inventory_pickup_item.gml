///scr_inventory_pickup_item(item)
var add_item = argument[0];

//check for item in inventory
for(var yy = 0; yy < obj_inventory.height;yy++){
    for(var xx = 0; xx < obj_inventory.width;xx++){
        if(obj_inventory.box[# xx,yy] == add_item){
            obj_inventory.count[# xx,yy]++;
            return true;
        }
    }    
}

//check for empty slot
for(var yy = 0; yy < obj_inventory.height;yy++){
    for(var xx = 0; xx < obj_inventory.width;xx++){
        if(obj_inventory.box[# xx,yy] == item.none){
            obj_inventory.box[# xx,yy] = add_item;
            obj_inventory.count[# xx,yy]++;
            return true;
        }
    }    
}

//show debug message
show_debug_message("The inventory is full!");
return false;
