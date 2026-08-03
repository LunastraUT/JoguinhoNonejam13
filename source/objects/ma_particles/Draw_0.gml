for (var i = 0; i < array_length(particles); i++) {
    var p = particles[i]
	if !p.active || p.spr == -1 {continue}

    draw_sprite_ext(p.spr, p.imgframe, p.px, p.py, p.size, p.size, p.angle, c_white, p.alpha)
} 

draw_set_alpha(1)
draw_set_colour(c_white)