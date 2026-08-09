depth = -1000

is_paused = false;

pause = function()
{
	is_paused = true
	pause_tag("pausavel")
}

unpause = function()
{
	is_paused = false
	unpause_tag("pausavel")
}
option_list_menu = [
	"retomar",
	"reiniciar nivel",
	"configurar",
	"sair"
]
option_list_options = [
	"voltar",
	"musica:",
	"sfx:"
]

if room == rm_menu || room == rm_creditos {array_delete(option_list_menu, 1, 1)}

option_list = option_list_menu

option_selected = 0

input_delay = 0
input_delay_max = 10

change_selection = function(_change = 0)
{
	if input_delay > 0 {
		return;
	}
	if _change != 0	{
		playSFX(snd_jump, true)
	}
	
	input_delay = input_delay_max
	
	option_selected += _change
	if option_selected < 0 {option_selected = array_length(option_list) - 1}
	if option_selected > array_length(option_list) - 1 {option_selected = 0}
}
change_selection()

change_list = function(_options) {
	option_list = _options
	option_selected = 0
}