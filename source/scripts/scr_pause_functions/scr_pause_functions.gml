function PausedElement(_id) constructor
{
	id = _id;
	pauses = [];
	
	static add = function(_length) {
		array_insert(pauses, 0, _length);
		return self;
	}
	
	static shift = function() {
		array_shift(pauses);
	}
	
	static update = function() {
		if (!instance_exists(id) || array_length(pauses) == 0) {return true}
		
		pauses[0]--
		if pauses[0] == 0 {shift()}
		
		return array_length(pauses) == 0
	}
}

function pause_object(_obj_or_id, _length = -1) {
	get_pause_manager()._pause_object(_obj_or_id, _length);
}

function unpause_object(_obj_or_id) {
	get_pause_manager()._unpause_object(_obj_or_id);
}

function pause_tag(_tag_or_tags, _length = -1) {
	get_pause_manager()._pause_tag(_tag_or_tags, _length);
}

function unpause_tag(_tag_or_tags) {
	get_pause_manager()._unpause_tag(_tag_or_tags);
}

function get_pause_manager()
{
	var _manager = noone;
	if !instance_exists(ma_pause) {
		_manager = instance_create_depth(0, 0, -999, ma_pause);
	} else {
		_manager = ma_pause;
	}
	
	return _manager;
}

function instance_exists_paused(_obj_or_id) {
	if instance_exists(_obj_or_id) {
		return true;
	}
	
	var _paused_elements = get_pause_manager().paused_elements
	for (var _i=0; _i < array_length(_paused_elements); _i++)
	{
		var _element = _paused_elements[_i]
		if (_element.id == _obj_or_id
		|| _element.id.object_index == _obj_or_id.object_index) {
			return true;
		}
	}
	
	return false;
}