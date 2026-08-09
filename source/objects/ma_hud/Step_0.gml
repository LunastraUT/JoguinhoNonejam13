if !is_paused {
	if INPUT_PAUSE {
		pause();
	}
}
else {
	
	if INPUT_BACK {unpause()}
	
	if INPUT_UP {change_selection(-1)}
	if INPUT_DOWN {change_selection(1)}
	if INPUT_CONFIRM
	{
		switch(option_list[option_selected])
		{
			case "retomar": unpause() break;
			case "reiniciar nivel": transRights(room) unpause() break;
			case "configurar": change_list(option_list_options) break;	
			case "sair": game_restart() break;
			
			case "voltar": change_list(option_list_menu) break;
			case "musica:": 
				if global.music_volume == 1 {
					global.music_volume = 0
				} else {
					global.music_volume += 0.1
				}
				audio_sound_gain(global.current_music, global.music_volume)
			break;
			case "sfx:": 
				if global.sfx_volume == 1 {
					global.sfx_volume = 0
				} else {
					global.sfx_volume += 0.1
				}
				var _sound = snd_mew
				if DEBUG {_sound = snd_entrosa}
				playSFX(_sound, true, 0, undefined, undefined, random_range(0.5, 2))
			break;
		}
	}
	
	if input_delay > 0
		input_delay--
}
