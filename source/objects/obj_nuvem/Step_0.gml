if disabled {
	sprite_index = spr_nuvem_poof
	//alpha_target = 0
	y_target = ystart
	disabled_timer--
} else {
	if place_meeting(x, y-6, obj_player){
		if obj_player.vsp >= 0 && obj_player.grounded == false {
			obj_player.y = y - 16;
			obj_player.grounded = true
		}
		
		y_target = ystart+1;
		rest_timer = rest_timer_max

		stepped = true
	} else {
		y_target = ystart
		
		if stepped {
			disabled = true
		}
	}
}

y = lerp(y, y_target, 0.1)
//image_alpha = lerp(image_alpha, alpha_target, 0.1)