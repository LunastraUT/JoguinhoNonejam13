grav = .2

ignore_collision = -has_grav

final_hsp = 0
final_vsp = 0

hsp = 0
vsp = 0

if has_grav == false {
	molasprite = spr_mola;
} else {
	molasprite = spr_mola_azul;
}

image_index = image_number-1
boing_height = 5.5

active = true;

function checabateria() {
	
	if instance_exists(obj_bateria){
		if needbattery == true {
			active = false;
			sprite_index = spr_mola_off;
		}
	} else {
		active = true;
		if sprite_index != molasprite	{
			image_index = 3;
			sprite_index = molasprite;
		}
	}	
}