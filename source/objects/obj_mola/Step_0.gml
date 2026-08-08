checabateria();

if active == true {
	if place_meeting(x, bbox_top, obj_player) && obj_player.vsp > 0 && !obj_player.ignore_collision {
		//boing
		playSFX(snd_mola)
		obj_player.vsp = -boing_height
		image_index = 0
	}

	if image_index >= image_number-1 {
		image_index = image_number-1	
	}

} else {
	image_index = 0;
}

if has_grav {
	if !place_meeting(x, y-1, global.collisions) {
		vsp += grav	
	}
}

final_hsp = hsp
final_vsp = vsp

hasCollision()