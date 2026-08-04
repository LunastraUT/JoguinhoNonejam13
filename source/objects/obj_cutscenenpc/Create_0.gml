event_inherited()

spd = 0

set_anim = function(_character)
{
	preloaded_animations = {
		idle: asset_get_index("spr_"+_character+"_idle"),
		walk: asset_get_index("spr_"+_character+"_walk"),
		wallhang: asset_get_index("spr_"+_character+"_wallhang"),
		fall: asset_get_index("spr_"+_character+"_fall"),
		jump: asset_get_index("spr_"+_character+"_jump")
	}
} 
set_anim(global.current_char)

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
