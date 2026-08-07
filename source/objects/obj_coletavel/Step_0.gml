sinthing = sin(current_time*0.005)*5
costhing = cos(current_time*0.002)

if collected == true {
	
//faz a coisa engraçada q a chave pula
if sprite_index != spr_bolo_pega {
		image_index = 0;
		sprite_index = spr_bolo_pega;
	
		y -= 1;
	}
	
	applygravityHELLYEAHBABY();
}