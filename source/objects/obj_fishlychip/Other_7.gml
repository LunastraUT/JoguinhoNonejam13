if sprite_index == spr_chip_ouch {
	sprite_index = spr_chip_idle;	
}

if sprite_index == spr_chip_dies {
	instance_destroy(self);
}
