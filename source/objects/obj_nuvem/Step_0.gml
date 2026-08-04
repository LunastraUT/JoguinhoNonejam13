if disabled {
	mask_index = -1
	y_target = ystart
	disabled_timer--
	if disabled_timer <= 0 {
		mask_index = sprite_index
		disabled = false
		disabled_timer = disabled_timer_max
	}
} else {
	if place_meeting(x, y-2, obj_player) {
		y_target = ystart+1
		rest_timer = rest_timer_max
		stand_timer--
		
		if stand_timer <= 0 {
			disabled = true
			stand_timer = stand_timer_max
		}
	} else {
		y_target = ystart
		
		rest_timer--
		if rest_timer <= 0 {
			stand_timer = stand_timer_max
			rest_timer = rest_timer_max
		}
	}
}

y = lerp(y, y_target, 0.1)