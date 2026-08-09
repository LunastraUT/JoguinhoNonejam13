y_bixin = lerp(y_bixin, y_target_bixin, 0.05)

if !finished {
	timer++
	if timer >= time_for_next {
		typing++
		timer = 0
	
		dialoguestring += string_char_at(text, typing)
	
		if typing >= max_typing {
			show_timer = show_timer_max
			finished = true
		}
	}
} else {
	show_timer--
	if show_timer <= 0 {
		showing = !showing
		show_timer = show_timer_max
	}
	if INPUT_CONFIRM {
		if ababa {
			transRights(rm_menu)
		} else {
			if text_index >= array_length(texts)-1 {
				text_index = 0
			} else {
				text_index += 1
			}
			reset()
		}

	}
}