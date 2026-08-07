if disabled {
	sprite_index = noone
	alpha_target = 0
	y_target = ystart
	disabled_timer--
} else {
	if place_meeting(x, y-2, obj_player) {
		y_target = ystart+1
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
image_alpha = lerp(image_alpha, alpha_target, 0.1)