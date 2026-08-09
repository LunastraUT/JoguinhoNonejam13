if has_grav {
	if !place_meeting(x, y-1, global.collisions) {
		vsp += grav	
	}
}

final_hsp = hsp
final_vsp = vsp

hasCollision()