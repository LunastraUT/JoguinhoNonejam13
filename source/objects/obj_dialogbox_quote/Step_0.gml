for(var _i = 0; _i < array_length(options); _i++) {
	var _opcao = options[_i]
	
	_opcao.timer++
	if _opcao.timer >= _opcao.time_for_next {
		_opcao.typing++
		_opcao.timer = 0
	
		_opcao.dialoguestring += string_char_at(_opcao.text, _opcao.typing)
	
		if _opcao.typing >= _opcao.max_typing && !_opcao.finished_typing {
			_opcao.finished_typing = true
		}
	}
	
	//options[_i] = _opcao
}

option_index += (INPUT_LEFT_PRESSED - INPUT_RIGHT_PRESSED)
option_index = clamp(option_index, 0, 1)

/*
if can_trigger && !triggered_callback {
	time_trigger++
	if time_trigger >= 50 {
		//callback()
		if instance_exists(ma_cutscenes) {
			finished = true
		}
		triggered_callback = true
	}
}*/

image_alpha = alpha
alpha = lerp(alpha, 1, 0.1)
y = lerp(y, y_target, 0.1)