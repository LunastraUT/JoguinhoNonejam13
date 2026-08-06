//sim eu vou fazer isso com sono hihi
sprite_index = spr_porta_off;
state = "inactive";

next_level = global.level.go_to

fakexscale = 1;
fakeyscale = 1;

function checkForBALLS(_balls) {
	
	if !instance_exists(_balls) {
		state = "active"	
	}
	//é só isso tmj

}

