//clean up to load dungeon layout
with(obj_place){//clear all type object that include children
    instance_destroy();
}

with(obj_lifeform_parent){//clear all type object that include children
    instance_destroy();
}
