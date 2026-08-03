take_damage = function(_damage) {
	
	return true;
}

skew = 0
skew_max = 0

//Fisica
	//Speed
	final_hsp = 0
	final_vsp = 0
	
	hsp = 0
	vsp = 0

	spd = 2

	//Jump
	j_height = 4
	grav = 0.2
	grav_mult = 1
	gravit = 1
	bind_jump = false
//

update_air_physics = function() {
	vsp += (grav*grav_mult)*gravit
	vsp = clamp(vsp, -60, 20)
}

//Juice
	xscale = 1
	yscale = 1
	xscale_target = 1
	yscale_target = 1
	scale_speed = 0.1
	
	fake_angle = 0
//

//Actor
	looking_at = 1 //-1 LEFT, 1 RIGHT
	grounded = true
//

draw = function(_blend = image_blend, _alpha = image_alpha) {
	//draw_sprite_pos(sprite_index, image_index, x+skew, y-sprite_height, (x+sprite_width)+skew, y-sprite_height, x+sprite_width, y, x, y, _alpha)
	draw_sprite_ext_skew(sprite_index, image_index, x, y, xscale * looking_at, yscale, fake_angle, skew, _blend, _alpha)
} 

//Animation
	preloaded_animations = {
		idle: spr_player
	}

	last_anim = noone
	current_anim = noone
	looped = false

	//Control
	weight_anim = 0
	anim_locked = false
	
	//Funcs
	anim_finished = false
//

function playAnim(_animName, _loop = false, _weight = 0, _forced = false, _startFrame = 0) //just like fnf ewww 
{
	if (!struct_exists(preloaded_animations, _animName)) {return}
	
	if (current_anim == _animName) {return}
	
	if (!_forced)
	{
		if (anim_locked) {return}
		if (_weight < weight_anim) {return}
	}
	
	last_anim = current_anim
	current_anim = _animName
	looped = _loop
	weight_anim = _weight
	
	sprite_index = preloaded_animations[$ current_anim]
	
	image_index = _startFrame;
}

function stopAnim() {
	weight_anim = 0
	anim_locked = false
	anim_finished = true
}

function updateLooking() {
	looking_at = sign(final_hsp) != 0 ? sign(final_hsp) : looking_at	
}

// STATE MACHINE
	states = ds_map_create();
	states[? "on_ground"] = {
		create: function() {},
		update: function() {},
		leave: function() {}
	};
	current_state = "on_ground"
	
	function changeState(newState) {
		if(!ds_map_exists(states, current_state)) {return}
	
		// old one
		method(self, states[? current_state].leave)();
	
		// new one
		current_state = newState
		method(self, states[? current_state].create)();
	}
//