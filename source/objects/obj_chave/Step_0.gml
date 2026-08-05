sinthing = sin(current_time*0.005)*5
costhing = cos(current_time*0.002)

//nossa que sono da disgraça ARGHRGH
if collected == true {
	if sprite_index != spr_chave_pega {
		image_index = 0;
		sprite_index = spr_chave_pega;
	
		y -= 1;
	}
	
	//faz a coisa engraçada q a chave pula
	applygravityHELLYEAHBABY();
	
	collectTimer += 1;
	
	if collectTimer >= 32 {
		instance_destroy(self);	
	}
	
}