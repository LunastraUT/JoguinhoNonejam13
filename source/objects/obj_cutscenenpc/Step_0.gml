// Inherit the parent event
event_inherited();

update_air_physics()

skew = lerp(skew, skew_max, 0.8)
final_hsp = lerp(final_hsp, hsp, 0.1)
final_vsp = vsp

hasCollision()

if grounded {
	if qnt_pulo > 0 && pode_pula {
		vsp = -j_height
		qnt_pulo--
		
		pode_pula = false
	}
	if hsp != 0 {
		looking_at = sign(final_hsp)
		skew_max = -3*final_hsp
		playAnim("walk", true)
	} else {
		skew_max = 0
		playAnim("idle", true)	
		
		if olhar != noone {
			looking_at = -sign(x-olhar.x)	
		}
	}
} else {
	pode_pula = true
	
	if vsp < 0 {
		playAnim("jump", false, 1)	
	} else {
		playAnim("fall", false, 1)
	}
}

if comer != noone && olhar != noone {
	if point_distance(x, y, comer.x, comer.y) < 20 {
			olhar = noone
			playAnim("bite", false, 3)
			alarm[0] = 15
	}
}