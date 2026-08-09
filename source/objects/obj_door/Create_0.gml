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


//pra checar se a sala começa com chave
jacomecaabertopo = false;

if !instance_exists(obj_chave) { //nossa que feio tudo hardcoded
	jacomecaabertopo = true; // é só pra ter certeza de que vai funcionar!! to com mt sono..
	sprite_index = spr_porta_on;
	state = "active";
}