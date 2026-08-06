global_pos = [x, y]

options = [
	{
		pos: global_pos,
		text: "cu"
	},
	{
		pos: global_pos,
		text: "buceta"
	},
]

option_index = 0

text_color = make_colour_rgb(0, 0, 85)

alpha = 0
y_target = y
y += 20

reset = function() {
	for(var _i = 0; _i < array_length(options); _i++) {
		var _opcao = options[_i]
		_opcao.pos = global_pos
		if _i == 0 {_opcao.pos[0] += 50}
		
		_opcao.dialoguestring = ""
		_opcao.max_typing = string_length(_opcao.text)
		_opcao.typing = 0
		_opcao.timer = 0
		_opcao.time_for_next = 2
		_opcao.finished_typing = false

		
		//options[_i] = _opcao
	}
}
reset()

normal_width = 1.2
normal_height = 0.5

can_trigger = false
time_trigger = 0
triggered_callback = false

finished = false