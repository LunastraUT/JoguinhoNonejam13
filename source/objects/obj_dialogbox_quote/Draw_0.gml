draw_set_alpha(alpha)


draw_set_colour(text_color)

for(var _i = 0; _i < array_length(options); _i++) {
	var _opcao = options[_i]
	
	draw_sprite_ext(spr_diabox, 0, _opcao.pos[0], _opcao.pos[1], normal_width, normal_height, 0, c_white, alpha)
	draw_text(_opcao.pos[0]+7, _opcao.pos[1]+8, _opcao.dialoguestring)
}


draw_set_alpha(1)