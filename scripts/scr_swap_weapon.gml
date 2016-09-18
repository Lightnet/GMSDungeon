///scr_swap_weapon(new_weapon)
var new_weapon = argument0;
var temp = weapon_sprite;
weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = temp;
