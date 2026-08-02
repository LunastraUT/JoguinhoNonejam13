 // Inherit the parent event
event_inherited();

spd = 6

//Camera
	camera = instance_create_depth(x, y, 0, obj_camera)
	//camera.target = self
	//camera.fix_pos()
//

#macro MOVE_H (INPUT_RIGHT - INPUT_LEFT)

//Coyote Jump 
	coyote_max = 10
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
	var _moveSpd = MOVE_H*spd
	
	hsp = _moveSpd
	
	updateLooking()
}

function jump() {
	if jump_buffer > 0 && (coyote_time > 0 || grounded) {
		xscale = 0.6
		yscale = 1.4
		
		//playSFX(snd_jump)
		vsp = -j_height
		
		coyote_time = 0
		jump_buffer = 0
	}
}

function land() {
	//spawnParticles(x+24, y, "land_ground", irandom_range(4, 6))
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
	},
	update: function() {
		move()
		jump()

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
			//playAnim("jump", false, 1)	
		}
	
		move()
		update_air_physics()
	
		if grounded {
			land()
			stopAnim()
			
			xscale = 1.5
			yscale = 0.6
			
			changeState("on_ground")
		} 
		 
		jump()
	},
	leave: function() {
		
	}
}