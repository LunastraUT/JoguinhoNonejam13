multiplyxscale = obj_player.x < x ? -1 : 1;

if place_meeting(x, bbox_top, obj_player) && obj_player.vsp > 0 && !obj_player.ignore_collision {
		/*if obj_player.vsp >= 4 {
			if sprite_index != spr_chip_dies{
				sprite_index = spr_chip_dies;
				playSFX(snd_splat, false, 0, global.sfx_volume, 0, 1.8)
			}
			canbebeaten = false;
		} else {
		
			if canbebeaten == true {*/
				//boing
				playSFX(snd_mola, false, 0, global.sfx_volume, 0, 1.5)
				obj_player.vsp = -boing_height
				//image_index = 0;
				//sprite_index = spr_chip_ouch;
				fakexscale = 1.25;
				fakeyscale = 0.75;
		/*}
		*/
}

if instance_number(obj_ovo) <= 0 {
	sprite_index = spr_pato_happy
	with(obj_chave) {
		if !collected {
			if !other.spawned_key {
				other.spawned_key = true
				x = other.x
				y = other.y
			}
			y = lerp(y, other.y - 32, 0.1);
		}
	}
}

with(obj_player)
{
	if sprite_index == spr_gato_dead {
		other.sprite_index = spr_pato_sad	
	}
}

fakexscale = lerp(fakexscale, 1, 0.15);
fakeyscale = lerp(fakeyscale, 1, 0.15);