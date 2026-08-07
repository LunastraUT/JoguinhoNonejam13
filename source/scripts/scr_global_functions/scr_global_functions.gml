function structTry(_struct, _name, _default)
{
    return variable_struct_exists(_struct, _name)
        ? variable_struct_get(_struct, _name)
        : _default
}

#region COLLISION STUFF
	function hasCollision(_callbackX = function(){}, _callbackY = function(){}) //Entity collision
	{
		
		if place_meeting(x+final_hsp, y, global.collisions) && !ignore_collision {
			while !place_meeting(x+sign(final_hsp), y, global.collisions) {
				x += sign(final_hsp)	
			}
			final_hsp = 0
			hsp = 0
			
			_callbackX()
		}
		x += final_hsp
		
		if place_meeting(x, y+final_vsp, global.collisions) && !ignore_collision {
			if vsp < 0 { //Corner fix
		        var _tries = 6
        
		        // direita
		        for (var i = 1; i <= _tries; i++) {
		            if !place_meeting(x + i, y + final_vsp, global.collisions) {
		                x += i
		                break
		            }
		        }
		        // esquerda
		        for (var i = 1; i <= _tries; i++) {
		            if !place_meeting(x - i, y + final_vsp, global.collisions) {
		                x -= i
		                break
		            }
		        }
		    }
		
			if place_meeting(x, y+final_vsp, global.collisions) {
				while !place_meeting(x, y+sign(final_vsp), global.collisions) {
					y += sign(final_vsp)
				}
			
				final_vsp = 0
				vsp = 0
				
				_callbackY()
			}
		}
		
		var _onSolid = place_meeting(x, y + 1, global.collisions);

		y += final_vsp
		
		grounded = _onSolid
	}

#endregion

#region SPRITE STUFF
function spawnParticles(_x = x, _y = y, _typeOrSingle, _amount, _externVar = noone)
{
	var _manager = noone
	if !instance_exists(ma_particles) {
		_manager = instance_create_depth(0, 0, -55, ma_particles)
	} else {_manager = ma_particles}
	
	if typeof(_typeOrSingle) == "string" 
	{_manager.type_particles(_x, _y, _typeOrSingle, _amount, _externVar)} else
	{_manager.spawn_particle(_typeOrSingle, _x, _y)}
}

function draw_sprite_ext_skew(_spr, _frame, _x, _y, _xscale, _yscale, _angle, _skew, _blend, _alpha)
{
    var _offx = sprite_get_xoffset(_spr) * _xscale
    var _offy = sprite_get_yoffset(_spr) * _yscale

    var _sprW = sprite_get_width(_spr) * _xscale
    var _sprH = sprite_get_height(_spr) * _yscale

    var _x1 = -_offx + _skew
    var _y1 = -_offy

    var _x2 = -_offx + _sprW + _skew
    var _y2 = -_offy

    var _x3 = -_offx + _sprW
    var _y3 = -_offy + _sprH

    var _x4 = -_offx
    var _y4 = -_offy + _sprH

    var _cos = dcos(_angle)
    var _sin = dsin(_angle)
    
	draw_set_colour(_blend)
	
    draw_sprite_pos(
        _spr, _frame,

        _x + _x1 * _cos - _y1 * _sin,
        _y + _x1 * _sin + _y1 * _cos,

        _x + _x2 * _cos - _y2 * _sin,
        _y + _x2 * _sin + _y2 * _cos,

        _x + _x3 * _cos - _y3 * _sin,
        _y + _x3 * _sin + _y3 * _cos,

        _x + _x4 * _cos - _y4 * _sin,
        _y + _x4 * _sin + _y4 * _cos,

        _alpha
    )
}

#endregion

#region TRANSITION STUFF
	function transRights(_room) {
	    global.transition_to = _room
	    var _transmanager = noone
    
	    if !instance_exists(ma_transition) {
	        instance_create_depth(0, 0, 1, ma_transition)
	    }
	    _transmanager = ma_transition
    
	    _transmanager.image_index = 0
	    _transmanager.sprite_index = spr_transition_in
	    _transmanager.trans = transes.IN
	    _transmanager.transitioning = true
	}
#endregion