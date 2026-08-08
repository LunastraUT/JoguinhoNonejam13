if place_meeting(x, bbox_top, obj_player) && obj_player.vsp > 0 && !obj_player.ignore_collision {
	//boing
	playSFX(snd_mola)
	obj_player.vsp = -boing_height
		
	instance_destroy()
} 