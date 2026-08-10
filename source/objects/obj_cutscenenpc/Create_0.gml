event_inherited()

spd = 1
j_height = 2
qnt_pulo = 0
pode_pula = true

character = "gato"

olhar = noone
comer = noone

//Animations
reset = function() {
    preloaded_animations = {
        idle: asset_get_index("spr_"+character+"_idle"),
        walk: asset_get_index("spr_"+character+"_walk"),
        fall: spr_gato_fall, 
        jump: spr_gato_jump,
        cake: spr_gato_cake
    }
}
reset()
//   

cor_gato = global.gatos[0]
draw = function(_blend = image_blend, _alpha = image_alpha) {
    draw_sprite_ext_skew(sprite_index, image_index, x, y, xscale * looking_at, yscale, fake_angle, skew, _blend, _alpha)
    
    if character == "gato" {
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
}

jump = function(_amount, _qnt_pulo = 1)
{
    return {
        setup : false,
        amount : _amount,
        qntpulito : _qnt_pulo,
        caller : id,
        func : function(self)
        {
            if (!self.setup)
            {
                self.caller.j_height = self.amount
                self.caller.qnt_pulo = self.qntpulito
                
                self.setup = true
            }
            return self.caller.grounded
        }
    }
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

            self.caller.hsp = sign(self.amount)*1
            if abs(self.caller.x - self.x_old) >= abs(self.amount) {
                self.caller.hsp = 0
                return true    
            }
            return false
        }
    }
}

playbosta = function(_animname, _looped = false, _weight = 0, _forced = 0)
{
    return {
        setup : false,
        animname : _animname,
        looped : _looped,
        weight : _weight,
        forced : _forced,
        caller : id,
        func : function(self)
        {
            if (!self.setup)
            {
                self.caller.playAnim(self.animname, self.looped, self.weight, self.forced)
                
                self.setup = true
            }
            return true
        }
    }
}