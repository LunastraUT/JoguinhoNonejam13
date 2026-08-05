if disabled {
	sprite_index = noone
	y_target = ystart
	disabled_timer--
} else {
	if place_meeting(x, y-2, obj_player) {
		y_target = ystart+1
		rest_timer = rest_timer_max

		stepped = true
	} else {
		y_target = ystart
		
		rest_timer--
		if rest_timer <= 0 {
			stand_timer = stand_timer_max
			rest_timer = rest_timer_max
		}
	}
	
	if stepped {
		stand_timer--
		
		if stand_timer <= 0 {
			alpha_target = 0
			disabled = true
			stand_timer = stand_timer_max
		}
	}
}



y = lerp(y, y_target, 0.1)
image_alpha = lerp(image_alpha, alpha_target, 0.1)