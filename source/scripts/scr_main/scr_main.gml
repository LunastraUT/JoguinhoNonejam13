randomise()

global.particle_max = 200
global.collisions = [obj_colisor, obj_bloco_cobre, obj_nuvem, obj_bloco_fragil, obj_bloco_da_chave]

global.sfx_volume = 1
global.music_volume = 1

global.current_music = noone

global.transition_to = noone
enum transes {
    IN,
    OUT
}

global.gatos = {
	rosa:      make_color_rgb(255, 170, 255),
	ciano:     make_color_rgb(85, 255, 255),
	azul:      make_color_rgb(0, 170, 255),
	verde:     make_color_rgb(85, 170, 85),
	amarelo:   make_color_rgb(255, 170, 0),
	vermelho:  make_color_rgb(255, 0, 85),
	roxo:      make_color_rgb(170, 85, 170),
	preto:     make_color_rgb(85, 85, 170)
}

global.collectables_data = {
	bolo: {points: 10, harmful: false},
	cookiemorango: {points: 10, harmful: false}
}

#macro DEBUG false
#macro RES_W 320
#macro RES_H 180
 
display_set_gui_size(RES_W, RES_H)
draw_set_font(fnt_main)

camera_set_view_size(view_camera[0], RES_W, RES_H)
window_set_size(RES_W*3, RES_H*3)
window_center()

if DEBUG {room_goto(rm_debug)} else {room_goto(rm_menu)}