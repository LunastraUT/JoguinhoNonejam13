particles = array_create(global.particle_max)
particle_groups = []
group_index = 0
particle_index = 0

for (var i = 0; i < global.particle_max; i++)
{
    particles[i] = {
        active : false,

        spr : -1,

        px : 0,
        py : 0,

        spd : 0,
        dir : 0,

        incrementspd : 0,
        incrementdir : 0,

        life : 0,
        size : 1,
		
		invertspeed : false,
        follow_dir : false
    };
}

function spawn_particle_group()
{
    var _id = group_index
    group_index++
	
    particle_groups[_id] = {
        alive : 0,
        active : true
    }

    return _id
}

function spawn_particle(_p, _x = x, _y = y)
{
	var _oldIndex = particle_index
    var p = particles[_oldIndex]

    particle_index++

    if (particle_index >= global.particle_max)
    {
        particle_index = 0
    }

    p.active = true
	
	p.group = structTry(_p, "group", -1)
	if (p.group != -1)
    {
        particle_groups[p.group].alive++
    }

    p.spr = structTry(_p, "spr", fx_dust)

    p.px = structTry(_p, "px", _x)
    p.py = structTry(_p, "py", _y)

    p.spd = structTry(_p, "spd", 0)
	
    p.vsp = structTry(_p, "vsp", 0)
    p.hsp = structTry(_p, "hsp", 0)
	p.grav = structTry(_p, "grav", 0)
	
    p.incrementspd = structTry(_p, "incrementspd", 0)

    p.dir = structTry(_p, "dir", 0)
    p.incrementdir = structTry(_p, "incrementdir", 0)

    p.life = structTry(_p, "life", 50)

    p.size = structTry(_p, "size", 1)

    p.follow_dir = structTry(_p, "follow_dir", true)
    p.angle = structTry(_p, "angle", 0)

    p.alpha = structTry(_p, "alpha", 1)
    p.imgframe = structTry(_p, "imgframe", floor(random(sprite_get_number(p.spr))))
	
	p.invertspeed = structTry(_p, "invertspeed", true)

    particles[_oldIndex] = p
}

type_particles = function(_x = 0, _y = 0, _type = "roundpuff", _amount = 5, _externVar = noone) {
	var _g = spawn_particle_group()
	switch(_type) {
		case "roundpuff":
			var _dir = 0
			repeat(_amount) {
				_dir += 360/_amount
				spawn_particle({
					group: _g,
					
					spr:			fx_bigdust,
					px:				_x,
					py:				_y,
			        spd:			3,
			        incrementspd:	-0.3,
			        dir:			_dir,
			        incrementdir:	0,
					follow_dir:		false,
			        life:			20,
			        size:			1,
					invertspeed:	false
				})
			}
		break;
		case "landground":
			var _i = 0
			repeat(_amount) {
				var _dir = 0
				var _xrange = 2*_i+1
				if _i > _amount/2 {_xrange = -_xrange _dir = 180}
				spawn_particle({
					group: _g,
					
					spr:			fx_bigdust,
			        px:				_x+_xrange,
			        py:				_y,
			        spd:			4,
			        incrementspd:	-0.5,
			        dir:			_dir,
					follow_dir:		false,
					invertspeed:	false,
					life:			15,
				})
				_i++
			}
		break;
	}
}