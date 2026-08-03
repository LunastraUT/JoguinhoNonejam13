global.coroutines = []

function wait(_wait = 0) {
	return {
		wait_time: _wait*60,
		func : function(self)
		{
			self.wait_time--
			
			return self.wait_time <= 0
		}
	}
}

function mix(cmds = []) {
	return {
		command_list : cmds,
		func : function(self)
		{
			for(var _i = array_length(self.command_list)-1; _i >= 0; _i--) {
				var _cmd = self.command_list[_i]
				if _cmd.func(_cmd) {
					array_delete(self.command_list, _i, 1)
				}
			}
			
			return array_length(self.command_list) <= 0
		}
	}
}

function waitList(_function) {
	array_push(global.coroutines, _function);
}