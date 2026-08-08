image_index = image_number-1
boing_height = 5.5

active = false;

function checabateria() {
	if instance_exists(obj_bateria){
			active = true;
			sprite_index = spr_mola_cobre;
	} else {
		active = false;
		if sprite_index != spr_mola_energizado	{
			sprite_index = spr_mola_energizado
		}
	}
}