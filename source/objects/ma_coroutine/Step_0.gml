if array_length(global.coroutines) > 0
{
	var _c = global.coroutines[0]
	
	if (_c.func(_c))
	{
		array_shift(global.coroutines);
	}
} 