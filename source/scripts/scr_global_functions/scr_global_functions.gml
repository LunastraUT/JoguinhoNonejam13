function structTry(_struct, _name, _default)
{
    return variable_struct_exists(_struct, _name)
        ? variable_struct_get(_struct, _name)
        : _default
}

#region COLLISION STUFF
	function hasCollision(_callbackX = function(){}, _callbackY = function(){}) //Entity collision
	{
		if place_meeting(x+final_hsp, y, global.collisions) {
			while !place_meeting(x+sign(final_hsp), y, global.collisions) {
				x += sign(final_hsp)	
			}
			final_hsp = 0
			hsp = 0
			
			_callbackX()
		}
		x += final_hsp
		
		if place_meeting(x, y+final_vsp, global.collisions) {
			if vsp < 0 { //Corner fix
		        var _tries = 24
        
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
		_manager = instance_create_depth(0, 0, -999, ma_particles)
	} else {_manager = ma_particles}
	
	if typeof(_typeOrSingle) == "string" 
	{_manager.type_particles(_x, _y, _typeOrSingle, _amount, _externVar)} else
	{_manager.spawn_particle(_typeOrSingle, _x, _y)}
}

function draw_sprite_ext_skew(_spr, _fram, _x, _y, _xscale, _yscale, _angle, _skew, _blend, _alpha) {
    var _offX = sprite_get_xoffset(_spr)
    var _offY = sprite_get_yoffset(_spr)

    var _sprWidth = sprite_get_width(_spr) * _xscale
    var _sprHeight = sprite_get_height(_spr) * _yscale

    var _left   = _x - _offX * _xscale
    var _up    = _y - _offY * _yscale
    var _right  = _left + _sprWidth
    var _bottom = _up + _sprHeight

    draw_sprite_pos(
        _spr, _fram,
        _left + _skew, _up,
        _right + _skew, _up,
        _right, _bottom,
        _left, _bottom,
        _alpha
    )
	//draw_sprite_ext(sprite_index, image_index, x, y, xscale * looking_at, yscale, fake_angle, _blend, _alpha)
}

#endregion