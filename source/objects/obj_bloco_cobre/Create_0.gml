event_inherited()
function checabateria() {
	if instance_exists(obj_bateria){
		active = false;
		sprite_index = spr_copperblock_off;
	} else {
		active = true;
		if sprite_index != spr_copperblock_on	{
			sprite_index = spr_copperblock_on;
		}
	}	
}