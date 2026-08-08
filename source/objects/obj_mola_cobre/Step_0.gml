checabateria();

if active {
	if image_index >= image_number-1 {
		image_index = image_number-1	
	}
}
if place_meeting(x, bbox_top, obj_player) {
	if !active {
		obj_player.morte()
	} else if obj_player.vsp > 0 {
		playSFX(snd_mola)
		image_index = 0
		obj_player.vsp = -boing_height
	}
}