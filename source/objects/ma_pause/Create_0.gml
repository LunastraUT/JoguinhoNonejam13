paused_elements = []
pause_queue = []
unpause_queue = []

_pause_object = function(_obj_or_id, _length = -1)
{
	array_push(pause_queue, {object: _obj_or_id, length: _length});
}

_unpause_object = function (_obj_or_id)
{
	array_push(unpause_queue, _obj_or_id);
}

_pause_tag = function(_tag_or_tags, _length = -1)
{
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for (var _i=0; _i < array_length(_assets); _i++) {
		_pause_object(_assets[_i], _length);
	}
}

_unpause_tag = function (_tag_or_tags)
{
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object);
	for (var _i=0; _i < array_length(_assets); _i++) {
		_unpause_object(_assets[_i]);
	}
}