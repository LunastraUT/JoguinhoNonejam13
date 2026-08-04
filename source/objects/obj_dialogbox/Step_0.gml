timer++
if timer >= time_for_next {
	typing++
	timer = 0
	
	dialoguestring += string_char_at(text, typing)
	
	if typing >= max_typing {
		can_trigger = true
	}
}

if can_trigger && !triggered_callback {
	time_trigger++
	if time_trigger >= 50 {
		//callback()
		if instance_exists(ma_cutscenes) {
			finished = true
		}
		triggered_callback = true
	}
}

image_alpha = alpha
alpha = lerp(alpha, 1, 0.1)
y = lerp(y, y_target, 0.1)