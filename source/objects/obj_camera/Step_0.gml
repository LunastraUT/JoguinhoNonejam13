if target != noone {
	var _reg = instance_position(target.x, target.y, obj_boundcamera)

	if (_reg != current_region)
	{
	    if (_reg)
	    {
	        current_region = _reg

	        cam_bound = _reg.my_bound

			if cam_init {
				cam_state = camera_states.transition
			}
		}
		else
        {
            current_region = noone

            cam_bound = cam_bound_default

			if cam_init {
				cam_state = camera_states.transition
			}
        }
		
		if !cam_init {
			cam_follow_x = target.x-RES_W/2
			cam_follow_y = target.y-RES_H/2
			
			cam_init = true
		}
	}
}

switch(cam_state)
{
    case camera_states.follow:
		var _shake = [0, 0]
		if shake >= 0.1 {
			_shake = [random_range(-shake, shake), random_range(-shake, shake)]
			shake *= .95
		}
	
		var _xx = target.x-RES_W/2
		var _yy = target.y-RES_H/2
	
		if object_get_name(target.object_index) == "obj_player" {
			with(target)
			{	
				var _limit = 150
				var _increment = 10
				switch(current_state) {
					case "jump":
						other.cam_offset_y = 0
						if sign(hsp) != 0 {
							other.cam_offset_x += _increment*looking_at
					
							other.cam_offset_x = clamp(other.cam_offset_x, -_limit, _limit)
						}
					break;
				}

			}
		}
		
		cam_follow_x = _xx
		cam_follow_y = _yy

        var _targetX = cam_follow_x + cam_offset_x
        var _targetY = cam_follow_y + cam_offset_y

        _targetX = clamp(
            _targetX,
            cam_bound[0],
            cam_bound[2] - RES_W
        )

        _targetY = clamp(
            _targetY,
            cam_bound[1],
            cam_bound[3] - RES_H
        )

        x = lerp(x, _targetX+_shake[0], cam_speed)
        y = lerp(y, _targetY+_shake[1], cam_speed)
    break;

    case camera_states.transition:
		transition_speed = current_region == noone ? 0.05 : cam_speed_default
	
	    var _targetX = target.x - RES_W/2
	    var _targetY = target.y - RES_H/2

	    _targetX = clamp(
	        _targetX,
	        cam_bound[0],
	        cam_bound[2] - RES_W
	    )

	    _targetY = clamp(
	        _targetY,
	        cam_bound[1],
	        cam_bound[3] - RES_H
	    )

	    x = lerp(x, _targetX, transition_speed)
	    y = lerp(y, _targetY, transition_speed)
		
		var _inside =
			x  > cam_bound[0]
		&&	x   < cam_bound[2]
		&&	y > cam_bound[1]
		&&	y    < cam_bound[3]

	    if _inside
	    {
	        cam_state = camera_states.follow
	    }
    break;
	case camera_states.locked:
	    var _targetX = clamp(
            cam_follow_x,
            cam_bound[0],
            cam_bound[2] - RES_W
        )

        var _targetY = clamp(
            cam_follow_y,
            cam_bound[1],
            cam_bound[3] - RES_H
        )
	
		x = _targetX
		y = _targetY
		
		cam_state = camera_states.follow
		//porenquanto
	break;
	case camera_states.quotes:
		
		
	break;
}

camera_set_view_pos(view_camera[0], x, y)
camera_set_view_size(view_camera[0], res_w, res_h)


//Parallax
for(var _bg = 0; _bg < array_length(parallax_data); _bg++) {
	var _data = parallax_data[_bg]
	var _layerId = layer_get_id(_data.layer_name)
		
	if _data.update != -1 {_data.update(_data)}
		
	// moving bg
	_data.position[0] += _data.move_speed[0]
	_data.position[1] += _data.move_speed[1]
		
	// rendering
	var _x = _data.position[0]
	var _y = _data.position[1]
	layer_x(_layerId, (x+_x)/_data.parallax[0])
	layer_y(_layerId, (y+_y)/_data.parallax[1])
}