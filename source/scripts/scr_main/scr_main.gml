global.particle_max = 200
global.level = 1
global.collisions = [obj_colisor]

global.gatos = {
	rosa: $FFAAFF,
	ciano: $55FFFF,
	azul: $00AAFF,
	verde: $55AA55,
	amarelo: $FFAA00,
	vermelho: $FF0055,
	roxo: $AA55AA,
	preto: $5555AA
}

global.collectables_data = {
	bolo: {points: 10, harmful: false},
	cookiemorango: {points: 10, harmful: false}
}

#macro DEBUG true
#macro RES_W 320
#macro RES_H 180

draw_set_font(fnt_main)