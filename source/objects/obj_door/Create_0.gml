//sim eu vou fazer isso com sono hihi
sprite_index = spr_porta_off;
state = "inactive";

fakexscale = 1;
fakeyscale = 1;

abriu = false

function checkForBALLS(_bals) {
	
	if !instance_exists(_bals) && !abriu {
		abriu = true
		state = "active"	
	}
	//é só isso tmj

}

