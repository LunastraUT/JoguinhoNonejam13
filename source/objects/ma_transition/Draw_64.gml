if transitioning {
	switch(trans)
	{
		case transes.IN:
			draw_sprite_ext(sprite_index, image_index, 0, 0, 10, 18, 0, c_white, 1)
			
			if image_index >= image_number-1 {
				transitioning = false
			}
		break;
		case transes.OUT:
			draw_sprite_ext(sprite_index, image_index, 0, 0, 10, 18, 0, c_white, 1)
			
			if image_index >= image_number-1 {
				transitioning = false
			}
		break;
	}	
}
else if global.transition_to != noone {
	room_goto(global.transition_to)
}