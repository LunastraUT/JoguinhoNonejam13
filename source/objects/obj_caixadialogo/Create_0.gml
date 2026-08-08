text = "oi eu sou o placeholder"
text_color = make_colour_rgb(0, 0, 85)
dialoguestring = ""
max_typing = 0
typing = 0 
timer = 0
time_for_next = 2

alpha = 0
y_target = y
y += 20

rabinho_target = noone
right = false

reset = function() {
	dialoguestring = ""
	max_typing = string_length(text)
	typing = 0 
	timer = 0
	
	var _textL = string_width(text)
	var _textW = string_height(text)
	
	normal_width = 0.4+0.02*_textL
	normal_height = 0.4+0.02*_textW

	image_xscale = normal_width
	image_yscale = normal_height
	
	if rabinho_target != noone {
		var _offset = 5-sprite_width
		if right {
			_offset = -10
		}
		x = rabinho_target.x+_offset
	}
}
reset()

rabinho_origem = x+5

callback = function() {
	text = "oi eu sou o proximo texto e tal so pra testa"
	reset()
}
can_trigger = false
time_trigger = 0
triggered_callback = false

finished = false