if state == "active" {
	//isso aqui é um mamão na roda heh
	if sprite_index != spr_porta_on {
	
		sprite_index = spr_porta_on;
		fakexscale = 0.5;
		fakeyscale = 1.5;
	}
	
	//faça o lerp meu filho
	fakexscale = lerp(fakexscale, 1, 0.15);
	fakeyscale = lerp(fakeyscale, 1, 0.15);
}

checkForBALLS(obj_chave);

image_xscale = fakexscale;
image_yscale = fakeyscale;