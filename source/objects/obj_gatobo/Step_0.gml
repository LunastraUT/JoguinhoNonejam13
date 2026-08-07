// Inherit the parent event
if anim_finished {
	playAnim("idle", false, 1)
}

event_inherited();

if cuspe_timer <= 0 {
	shoot()
	
	cuspe_timer = cuspe_timer_max
} else {	
	cuspe_timer--
}

xscale = image_xscale