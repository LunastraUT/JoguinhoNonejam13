switch(state) {
	case "inactive":
		checkForBALLS(obj_chave);
	break;
	case "active":
		//isso aqui é um mamão na roda heh				eh um oq??????
		if sprite_index != spr_porta_on {
			playSFX(snd_portaabre)
			sprite_index = spr_porta_on;
			fakexscale = 0.5;
			fakeyscale = 1.5;
		}
	
		//faça o lerp meu filho
		fakexscale = lerp(fakexscale, 1, 0.15);
		fakeyscale = lerp(fakeyscale, 1, 0.15);
	
		if place_meeting(x, y, obj_player) && obj_player.final_vsp = 0 { //gambiarra preguica
			state = "entering"
		}
	break;
	case "entering": 
		if sprite_index != spr_porta_end {
			sprite_index = spr_porta_end;
			obj_player.changeState("enterdoor")
		}
		
		if image_index >= image_number-1 {
			levarparaoproximolevel(next_level)
			
			state = "cacetada"
		}
	break;
}

if sprite_index = spr_porta_end && image_index >= image_number-1 {
	image_index = image_number-1
}

image_xscale = fakexscale;
image_yscale = fakeyscale;