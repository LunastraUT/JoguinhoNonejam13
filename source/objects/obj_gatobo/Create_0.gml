// Inherit the parent event
event_inherited();
	  
cuspe_timer = cuspe_timer_max  

preloaded_animations = {
	"cuspe": spr_gatobo
}

shoot = function() {
	playAnim("cuspe", false, 0, true)
	
	var _projetilzinho = instance_create_depth(x+15*image_xscale, y-8, depth - 1, obj_serra)
	_projetilzinho.hsp = 1*image_xscale
}