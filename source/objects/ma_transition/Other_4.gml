if global.transition_to != noone {
	trans = transes.OUT
	sprite_index = spr_transition_out
	image_index = 0
	transitioning = true
	global.transition_to = noone
}