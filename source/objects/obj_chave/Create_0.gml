sinthing = 0
costhing = 0

quantaschaveporra = instance_count;
randomsoundpitch = random_range(0.9, 1.1);

depth = 50;

collectTimer = 0;
collected = false;

grav = 1.5;

function applygravityHELLYEAHBABY() {
	
	//bem simples tmj?? nao precisa de mt e uacho
	vsp = -1.0;
	grav -= 0.08;
	
	y += vsp * grav;
	
}

collected_sprite = spr_chave_pega