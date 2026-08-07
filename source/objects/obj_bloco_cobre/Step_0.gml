checabateria();

if active == true {
	if place_meeting(x, bbox_top-1, obj_player) {
		obj_player.morte()
	}
} else {
	if sprite_index != spr_copperblock_off {
		 sprite_index = spr_copperblock_off;
	}
}


