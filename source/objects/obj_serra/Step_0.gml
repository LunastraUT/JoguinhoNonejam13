if !drop {
	if place_meeting(x+1*image_xscale, y, obj_colisor) {
		bateu()
	}
	var _blocofragil = instance_place(x+1*image_xscale, y, obj_bloco_fragil)
	if _blocofragil {
		bateu()
		
		_blocofragil.morteinstantanea()
	}
} else {
	vsp += grav
	
	lerp_speed = 0.05
	x_scale_target = 0	
	y_scale_target = 0	
}

image_xscale = lerp(image_xscale, x_scale_target, lerp_speed)
image_yscale = lerp(image_yscale, y_scale_target, lerp_speed)

x += hsp*spd
y += vsp