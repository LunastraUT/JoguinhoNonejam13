if place_meeting(x, bbox_top, obj_player) && obj_player.vsp > 0 {
	//boing
	playSFX(snd_entrosa)
	obj_player.vsp = -boing_height
	image_index = 0
}

if image_index >= image_number-1 {
	image_index = image_number-1	
}