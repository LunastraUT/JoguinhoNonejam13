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
	}
} else {
	pode_pula = true
	
	if vsp < 0 {
		playAnim("jump", false, 1)	
	} else {
		playAnim("fall", false, 1)
	}
}