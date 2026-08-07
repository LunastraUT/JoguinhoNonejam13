// Inherit the parent event
event_inherited();

cuspe_timer_max = 160		  
cuspe_timer = cuspe_timer_max  

preloaded_animations = {
	idle: spr_gatobo_idle,
	cuspe: spr_gatobo_cuspindo
}

shoot = function() {
	playAnim("cuspe", false, 2)
	
	var _projetilzinho = instance_create_layer(x, y-10, "Entities", obj_serra)
	_projetilzinho.hsp = 1*image_xscale
}