if !looped {
	if image_index >= image_number - 1 {
		image_index = image_number - 1
		anim_finished = true
	}
}

if anim_finished {
	weight_anim = 0
	anim_locked = false
	
	anim_finished = false
}

xscale = lerp(xscale, xscale_target, scale_speed)
yscale = lerp(yscale, yscale_target, scale_speed)

if (ds_map_exists(states, current_state)) {
	method(self, states[? current_state].update)();
}

underwater = place_meeting(x, y, obj_aguinha)
if underwater {
	spd = spd_underwater 
	grav = grav_underwater
	vsp_max = vsp_max_underwater
} 
else {
	spd = spd_default 
	grav = grav_default
	vsp_max = vsp_max_default
}
	
