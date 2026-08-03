//Cam vars
	enum camera_states {
		follow,
		transition,
		locked
	}

	cam_state = camera_states.locked

	target = noone
	
	cam_offset_x = 0
	cam_offset_y = 0
	
	//Follow
		cam_speed_default = 0.1
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