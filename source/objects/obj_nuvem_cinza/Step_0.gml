if disabled {

	sprite_index = spr_nuvem_cinza_poof
	//y_target = ystart
	disabled_timer--
} else {
	if place_meeting(x, y-6, obj_player){
		if obj_player.vsp >= 0 && obj_player.grounded == false {
			obj_player.vsp = 0;
			obj_player.y = y - sprite_height;
			obj_player.grounded = true
		}
		///aumentafoda
		//aumentamais += 4.0;
		aumentamais = clamp(aumentamais + 4.0, 0, 128.0);
		aumenta += 0.01 * aumentamais;
	
		y_target = ystart+1 + aumenta;
		rest_timer = rest_timer_max

		stepped = true
	} else {
		//y_target = ystart
		
		if stepped {
			disabled = true
		}
	}
}

y = lerp(y, y_target, 0.1)