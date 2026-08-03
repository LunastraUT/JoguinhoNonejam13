function BGElement(
	_layer_name,
	_parallax = [1, 1],
	_position = [0, 0],
	_move_speed = [0, 0],
	_update = -1
) constructor
{
	layer_name = _layer_name
	parallax = _parallax
	position = _position
	move_speed = _move_speed
	update = _update
	//[NAME, SCROLL_X, SCROLL_Y, X, Y]
	//["BG1", 6, 1, 0, 0],
}