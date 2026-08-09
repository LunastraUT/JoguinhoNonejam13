for(var _i = 0; _i < array_length(options); _i++) {
	var _opcao = options[_i]
	
	_opcao.timer++
	if _opcao.timer >= _opcao.time_for_next {
		_opcao.typing++
		_opcao.timer = 0
	
		_opcao.dialoguestring += string_char_at(_opcao.text, _opcao.typing)
	
		if _opcao.typing >= _opcao.max_typing && !_opcao.finished_typing {
			_opcao.finished_typing = true
			ta_podendo++
		}
	}
}

option_index += (INPUT_RIGHT_PRESSED - INPUT_LEFT_PRESSED)
option_index = clamp(option_index, 0, 1)

treco += (1 / 60) * 5

framedamaozinha += (1 / 60) * 6

image_alpha = alpha
alpha = lerp(alpha, 1, 0.1)
y = lerp(y, y_target, 0.1)

if ta_podendo >= 2 && !finished {
	if INPUT_CONFIRM {
		ma_cutscenes.escolha = option_index
		ma_cutscenes.final()
		finished = true
	}
}