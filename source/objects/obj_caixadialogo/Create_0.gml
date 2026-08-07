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

reset = function() {
	dialoguestring = ""
	max_typing = string_length(text)
	typing = 0 
	timer = 0
	
	normal_width = 1+0.085*max_typing
	normal_height = 0.5

	image_xscale = normal_width
	image_yscale = normal_height
}
reset()

rabinho_origem = x+5
rabinho_target = obj_player
right = false

callback = function() {
	text = "oi eu sou o proximo texto e tal so pra testa"
	reset()
}
can_trigger = false
time_trigger = 0
triggered_callback = false

finished = false