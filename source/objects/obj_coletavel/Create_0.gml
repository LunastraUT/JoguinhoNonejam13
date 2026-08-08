type = global.collectables_data.bolo
harmful = yoylecake;
points = type.points

sinthing = 0
costhing = 0

collected = false;

grav = 1.5;

if yoylecake {
	image_index = 3;	
}

function applygravityHELLYEAHBABY() {
	
	//bem simples tmj?? nao precisa de mt e uacho
	vsp = -1.0;
	grav -= 0.08;
	
	y += vsp * grav;
	
}