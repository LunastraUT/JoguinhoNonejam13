event_inherited()

drop = false

grav = .2

lerp_speed = 0.1
x_scale_target = 1
y_scale_target = 1

spd = 2
hsp = 0
vsp = 0

bateu = function() {
	vsp = -2
	hsp = (hsp*-1)*0.5
	active = false
	drop = true	
}

image_yscale = 0.5