// Inherit the parent event
event_inherited();

depth = 25;

morte = function() 
{
	if current_state != "morreudasilva" {
		changeState("morreudasilva")
	}	
}

//Action Timer
	action_timer = 0
//

//Skew
	skew = 0
	skew_max = 0
//

//Animations
	preloaded_animations = {
		idle: spr_gato_idle,
		walk: spr_gato_walk,
		fall: spr_gato_fall,
		jump: spr_gato_jump,
		dead: spr_gato_dead
	}
//     
 
cor_gato = global.gatos.rosa

draw = function(_blend = image_blend, _alpha = image_alpha) {
	draw_sprite_ext_skew(sprite_index, image_index, x, y, xscale * looking_at, yscale, fake_angle, skew, _blend, _alpha)
	
	shader_set(shd_color_replace)

	var _to = cor_gato 
	
	var _shTo = shader_get_uniform(shd_color_replace, "u_toColor")
	shader_set_uniform_f(
	    _shTo,
	    color_get_red(_to) / 255,
	    color_get_green(_to) / 255,
	    color_get_blue(_to) / 255
	)

	var _spriteName = sprite_get_name(sprite_index)
	var _sprite = asset_get_index(_spriteName+"_white")
	draw_sprite_ext_skew(_sprite, image_index, x, y, xscale * looking_at, yscale, fake_angle, skew, cor_gato, _alpha)

	shader_reset()
}

//Camera
	camera = instance_create_depth(x, y, 0, obj_camera)
	camera.target = self
	camera.fix_pos()
//

#macro MOVE_H (INPUT_RIGHT - INPUT_LEFT)

//Coyote Jump 
	coyote_max = 5
	coyote_time = coyote_max
//

//Jump buffer
	jump_buffer = 0
	jump_buffer_max = 10
//

function updateCollision() {
	hasCollision()
}

function move() {
	if MOVE_H != 0 {
		spd_max = 1*MOVE_H
		skew_max = -3*hsp
	} else {spd_max = 0 skew_max = 0}
	
	skew = lerp(skew, skew_max, 0.8)

	hsp = lerp(hsp, spd_max, 0.1)
	
	updateLooking()
}

function jump() {
	if jump_buffer > 0 && (coyote_time > 0 || grounded) {
		xscale = 0.6
		yscale = 1.4
		
		playSFX(snd_jump)
		vsp = -j_height
		
		coyote_time = 0
		jump_buffer = 0
	}
}

function land() {
	playSFX(snd_land)
	spawnParticles(x, y, "landground", 4)
}

function timers() { 
 	//Coyote
	if grounded {
	    coyote_time = coyote_max
	} else {
		if vsp >= 0 {
	    	coyote_time = max(coyote_time - 1, 0)
		} else {
			coyote_time = 0
		}
	}
	//Buffer
	if INPUT_JUMP || bind_jump {
	    jump_buffer = jump_buffer_max
	} else {
	    jump_buffer = max(jump_buffer - 1, 0)
	}
}

// GROUNDED STATE
states[? "on_ground"] = {
	create: function() {
		playAnim("idle", true)
		xscale_target = 1
		yscale_target = 1
		scale_speed = 0.2
		action_timer = 0
	},
	update: function() {
		move()
		jump()
		
		if MOVE_H != 0 {
			action_timer++
			if action_timer % 5 == 0 {
				var _part = {spr: choose(fx_dust, fx_dust2), spd: -looking_at*0.5, life: 30, dir: random_range(-10, 30), follow_dir: false}
				spawnParticles(x+10*-looking_at, y-5, _part, 1)
			} 
			
			playAnim("walk", true)
		}
		else {playAnim("idle", true)}

		if(!grounded) {
			xscale_target = 1
			yscale_target = 1
			
			changeState("jumping")
		}
	},
	leave: function() {
		
	}
}


// JUMPING STATE
states[? "jumping"] = {
	create: function() {
		
	},
	update: function() {
		if vsp < 0 {
			playAnim("jump", false, 1)	
		} else {
			playAnim("fall", false, 1)
		}
	
		move()
		update_air_physics()
	
		if grounded {
			stopAnim()
			
			if vsp > 0 {
				land()
				xscale = 1.5
				yscale = 0.6
			}
			
			changeState("on_ground")
		} 
		 
		jump()
	},
	leave: function() {
		
	}
}

states[? "levelend"] = {
	create: function() {
		playAnim("idle", true)
		action_timer = 0
		hsp = 0
	},
	update: function() {
		skew = lerp(skew, 0, 0.1)
		action_timer++
		
		if action_timer > 100 {
			if x > room_width+30 {
				room_goto(rm_choice)
			} else {
				looking_at = 1
				hsp = 1
				playAnim("walk", true)
			}
		}
	},
	leave: function() {
		
	}
}

states[? "enterdoor"] = {
	create: function() {
		image_alpha = 0
		hsp = 0
		vsp = 0
	},
	update: function() {},
	leave: function() {}
}

morreu = false
subiu = false

states[? "morreudasilva"] = {
	create: function() {
		hsp = 0
		vsp = -3
		
		playAnim("dead");
		
		if y > room_height {vsp = -5} 
		
		ignore_collision = true
		playSFX(snd_death)
	},
	update: function() {
		update_air_physics()
		if y > room_height+100 && !morreu && subiu {
			transRights(room)
			morreu = true
		}
	},
	leave: function() {
		
	}
}