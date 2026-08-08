for (var _i=0; _i < array_length(pause_queue); _i++)
{
	var _to_pause = pause_queue[_i];
	with (_to_pause.object) {
		var _index = array_find_index(other.paused_elements, function (_paused) {
			return _paused.id == id;
		})
		if _index != -1 {
			other.paused_elements[_index].add(_to_pause.length);
		} else {
			array_push(other.paused_elements, new PausedElement(id).add(_to_pause.length));
		}
	}
}
pause_queue = [];

for (var _i=0; _i < array_length(unpause_queue); _i++)
{
	with (unpause_queue[_i]) {
		var _index = array_find_index(other.paused_elements, function (_paused) {
			return _paused.id == id;
		})
		if _index != -1 {
			other.paused_elements[_index].shift();
		}
	}
}
unpause_queue = [];

for (var _i=0; _i < array_length(paused_elements); _i++)
{
	var _element = paused_elements[_i];
	if _element.update() {
		array_delete(paused_elements, _i, 1);
		_i--;
		continue;
	}
	instance_deactivate_object(_element.id);
}