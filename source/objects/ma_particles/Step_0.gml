for (var i = 0; i < global.particle_max; i++)
{
    var p = particles[i]

    if (!p.active)
        continue

    p.spd += p.incrementspd
    p.dir += p.incrementdir
	
	p.vsp += p.grav
	
    p.px += lengthdir_x(p.spd, p.dir) + p.hsp
    p.py += lengthdir_y(p.spd, p.dir) + p.vsp

	if p.follow_dir {p.angle = p.dir}

    p.life--

	if (p.life <= 0)
	{
	    p.active = false

	    if (p.group != -1)
	    {
	        var _g = particle_groups[p.group]

	        if (!is_undefined(_g))
	        {
	            _g.alive--

	            if (_g.alive <= 0)
	            {
	                _g = undefined
	            }

	            particle_groups[p.group] = _g
	        }
	    }
	}

    particles[i] = p
}