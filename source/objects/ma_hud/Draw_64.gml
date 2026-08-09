display_set_gui_size(RES_W, RES_H)
if is_paused
{
	draw_set_colour($550000)
	draw_rectangle(0, 0, RES_W, RES_H, false)
	draw_set_alpha(1.0)
	
		// BOTÕES!!
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	var _sep = 8
	var _x = RES_W/2
	var _y = (RES_H/2)-_sep*array_length(option_list)-1
	
	for (var _i = 0; _i < array_length(option_list); _i++)
	{
		var _extra = "" 
		if option_list[_i] == "musica:" {_extra = " "+string(round(global.music_volume*100))+"%" }
		if option_list[_i] == "sfx:" {_extra = " "+string(round(global.sfx_volume*100))+"%" }

		var _color = _i == option_selected ? c_white : $AA5555
		draw_set_colour(_color)
		
		draw_set_font(fnt_options)
		draw_text(
			_x,
			_y+_sep*_i, string_upper(option_list[_i]) + _extra
		)
	}
	

	// resetando o texto pro default vai que da bosta neh
	draw_set_font(fnt_main)
	draw_set_colour(c_black)
	draw_set_alpha(1.0)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	// sei la cara	
	
	for(var _i = 0; _i < array_length(global.finais); _i++) {
		var _pegou = global.finais[_i]
		var _xx = (RES_W/4)+20*_i+1
		
		draw_sprite(spr_bandeirinha_final, _pegou, _xx, room_height-25)	
	}
}