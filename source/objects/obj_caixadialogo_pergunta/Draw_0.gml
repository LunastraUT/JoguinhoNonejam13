draw_set_alpha(alpha)


draw_set_colour(text_color)

if !finished {
	for(var _i = 0; _i < array_length(options); _i++) {
		var _alpha = alpha
		var _index = 0
		
		var _opcao = options[_i]
		
		if option_index == _i {
			_index = (treco mod 2)+1
		}
	
		draw_sprite_ext(spr_diabox, _index, _opcao.pos[0], _opcao.pos[1], normal_width, normal_height, 0, c_white, _alpha)
		draw_text(_opcao.pos[0]+7, _opcao.pos[1]+8, _opcao.dialoguestring)
		
		if option_index == _i {
			draw_sprite(spr_maozinha, framedamaozinha, _opcao.pos[0] - 7, _opcao.pos[1] + 12)
		}
	}
}

draw_set_alpha(1)