//Cam vars
	enum camera_states {
		follow,
		transition,
		quotes,
		locked
	}
	
	res_w = RES_W
	res_h = RES_H
	cam_state = camera_states.locked
	if room == rm_choice {
		y += 100
		cam_state = camera_states.quotes
	}

	target = noone
	
	cam_offset_x = 0
	cam_offset_y = 0
	
	//Follow
		cam_speed_default = 0.8
		cam_speed = cam_speed_default
		cam_follow_x = 0
		cam_follow_y = 0
	//
	
	//Bound
		cam_bound_default = [0, 0, room_width, room_height] 
		cam_bound = cam_bound_default
	//
	
	//Shake
		shake = 0
	//
//

//Region
	current_region = noone
	transition_speed = 0.08
	cam_init = false
//

fix_pos = function() {
	cam_follow_x = target.x-RES_W/2
	cam_follow_y = target.y-RES_H/2
	
	x = cam_follow_x
	y = cam_follow_y
}

parallax_data = [
	[new BGElement("BG1", [5, 20]), new BGElement("BG2", [10, 20])]
]