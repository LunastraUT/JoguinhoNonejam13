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

function contador_de_bolo() constructor {
	x = 20
	y = 20
	on_screen_pos = 20
	off_screen_pos = -40
	move_pos = off_screen_pos
	move_speed = 0.1

	state = "hidden"
	time_for_hide = 0
	
	step = function() {
		if state == "hidden" {
			x = off_screen_pos
			return
		}
		switch(state)
		{
			case "hide":
				move_speed = 0.01
				
				move_pos = off_screen_pos
			break;
			case "show":
				move_speed = 0.1
			
				move_pos = on_screen_pos
				if x > on_screen_pos-1 {
					time_for_hide -= 1
					if time_for_hide <= 0 {
						state = "hide"
					}
				}
			break;
		}
		x = lerp(x, move_pos, move_speed)
	}
	
	show = function() {
		state = "show"
		time_for_hide = 30
	}	
	
	draw = function() {
		draw_set_halign(fa_left)
		draw_set_colour(c_white)
	
		draw_sprite(spr_bolo, 0, x, y+sin(current_time*0.002)*1.5)
		draw_text(x+10, y, global.bolos)
	}
}

conta_bolo = new contador_de_bolo()