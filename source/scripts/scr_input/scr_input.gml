//Keybinds DIOGOTVV

// ebaa me roubaram :3c -diogo

global.last_input = "keyboard";
global.inputs = {
	left: {
		keys: [ord("A"), vk_left],
		pads: [gp_padl],
	},
	right: {
		keys: [ord("D"), vk_right],
		pads: [gp_padr],
	},
	down: {
		keys: [ord("S"), vk_down],
		pads: [gp_padd],
	},
	up: {
		keys: [ord("W"), vk_up],
		pads: [gp_padu],
	},
	jump: {
		keys: [ord("C"), ord("L")],
		pads: [gp_face1],
	},
	pause: {
		keys: [vk_escape, vk_enter, ord("P")],
		pads: [gp_start],
	},
	confirm: {
		keys: [vk_enter, ord("Z")],
		pads: [gp_face1, gp_start],
	},
	back: {
		keys: [vk_escape],
		pads: [gp_face2],
	}
};

#macro LAST_INPUT global.last_input

// CONTROLES MOVIMENTO
#macro INPUT_LEFT sign(get_input(global.inputs.left) + (L_GP_HORIZONTAL < 0))
#macro INPUT_LEFT_PRESSED sign(get_input(global.inputs.left, "pressed"))
#macro INPUT_RIGHT sign(get_input(global.inputs.right) + (L_GP_HORIZONTAL > 0))
#macro INPUT_RIGHT_PRESSED sign(get_input(global.inputs.right, "pressed"))
#macro INPUT_UP sign(get_input(global.inputs.up) + (L_GP_VERTICAL < 0))
#macro INPUT_UP_PRESSED sign(get_input(global.inputs.up, "pressed"))
#macro INPUT_DOWN sign(get_input(global.inputs.down) + (L_GP_VERTICAL > 0))
#macro INPUT_DOWN_PRESSED get_input(global.inputs.down, "pressed")

// CONTROLES EXTRA
#macro INPUT_JUMP get_input(global.inputs.jump, "pressed")
#macro INPUT_JUMP_RELEASED get_input(global.inputs.jump, "released")

// INTERFACE
#macro INPUT_PAUSE get_input(global.inputs.pause, "pressed")
#macro INPUT_CONFIRM get_input(global.inputs.confirm, "pressed")
#macro INPUT_BACK get_input(global.inputs.back, "pressed")

// JOYSTICK
global.joystick_deadzone_horizontal = 0.2;
global.joystick_deadzone_vertical = 0.8;
#macro L_GP_VERTICAL get_joystick(0, 0)
#macro L_GP_HORIZONTAL get_joystick(0, 1)
#macro R_GP_VERTICAL get_joystick(0, 2)
#macro R_GP_HORIZONTAL get_joystick(0, 3)

// IGNORA ISSO AQUI BLAUBELUABELUBAEULB
function get_input(data, input = "hold")
{
	var keys = variable_struct_exists(data, "keys") ? data.keys : [];
	var pads = variable_struct_exists(data, "pads") ? data.pads : [];
	var mouse = variable_struct_exists(data, "mouse") ? data.mouse : [];
	var _result = 0;
	
	for (var _i = 0; _i < array_length(keys); _i++)
	{
		if input == "pressed"
			_result += keyboard_check_pressed(keys[_i]);
		else if input == "released"
			_result += keyboard_check_released(keys[_i]);
		else
			_result += keyboard_check(keys[_i]);
	}
	
	for (var _i = 0; _i < array_length(pads); _i++)
	{
		if input == "pressed"
			_result += gamepad_button_check_pressed(0, pads[_i]);
		else if input == "released"
			_result += gamepad_button_check_released(0, pads[_i]);
		else
			_result += gamepad_button_check(0, pads[_i]);
	}
	
	for (var _i = 0; _i < array_length(mouse); _i++)
	{
		if input == "pressed"
			_result += mouse_check_button_pressed(mouse[_i]);
		else if input == "released"
			_result += mouse_check_button_released(mouse[_i]);
		else
			_result += mouse_check_button(mouse[_i]);
	}
	
	return sign(_result);
}

function get_joystick(device, index)
{
	var _deadzone = 1.0
	if index mod 2 == 0
		_deadzone = global.joystick_deadzone_vertical
	else
		_deadzone = global.joystick_deadzone_horizontal
	
	var _gp = 0
	switch(index)
	{
		case 0: _gp = gamepad_axis_value(device, gp_axislv); break;
		case 1: _gp = gamepad_axis_value(device, gp_axislh); break;
		case 2: _gp = gamepad_axis_value(device, gp_axisrv); break;
		case 3:	_gp = gamepad_axis_value(device, gp_axisrh); break;
	}
	if abs(_gp) >= _deadzone
	{
	    return _gp;
	}
	return 0;
}