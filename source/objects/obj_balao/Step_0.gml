if place_meeting(x, bbox_top, obj_player) && obj_player.vsp > 0 && !obj_player.ignore_collision {
	//boing
	playSFX(snd_mola, false, 0, global.sfx_volume, 0, 0.75)
	obj_player.vsp = -boing_height
	
	if !fofinho { //nao pode ser fofinho
		if sprite_index != popsprite {
			image_index = 0;
			sprite_index = popsprite;
			playSFX(snd_tchuwa, false, 0, global.sfx_volume, 0, 1.8)
		}
	} else {
		fakexscale = 1.75;
		fakeyscale = 0.5;
		
		y = ystart	+ 10;
	}
	
} 

sinthing = sin(current_time*0.005)*5
costhing = cos(current_time*0.002)

y = lerp(y, ystart, 0.4);

fakexscale = lerp(fakexscale, 1, 0.15);
fakeyscale = lerp(fakeyscale, 1, 0.15);	