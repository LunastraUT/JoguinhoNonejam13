event_inherited()

spd = 0

//Animations
	preloaded_animations = {
		idle: asset_get_index("spr_gato_idle"),
		walk: asset_get_index("spr_gato_walk"),
		wallhang: asset_get_index("spr_gato_wallhang"),
		fall: asset_get_index("spr_gato_fall"),
		jump: asset_get_index("spr_gato_jump")
	}
//     

cor_gato = global.gatos.ciano
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

move = function(_amount)
{
	return {
		setup : false,
		amount : _amount,
		caller : id,
		func : function(self)
		{
			if (!self.setup)
			{
				self.x_old = self.caller.x
				
				self.setup = true
			}

			self.caller.spd = sign(self.amount)*1
			if abs(self.caller.x - self.x_old) >= abs(self.amount) {
				self.caller.spd = 0
				return true	
			}
			return false
		}
	}
}
