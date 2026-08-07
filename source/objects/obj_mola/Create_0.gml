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
		if sprite_index != spr_mola	{
			image_index = 3;
			sprite_index = spr_mola;
		}
	}	
}