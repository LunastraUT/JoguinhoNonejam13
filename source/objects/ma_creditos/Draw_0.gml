draw_set_font(fnt_options)
draw_set_halign(fa_center)

var _x = room_width/2
var _y = room_height/2
var _esp = 20

draw_sprite_ext(spr_nara, image_index, _x+_esp, y_bixin, -1, 1, 0, c_white, 1)
draw_sprite(spr_emy, image_index, _x-_esp, y_bixin)

draw_text(_x, 20, "OBRIGADO POR JOGAR!")
draw_text(_x, _y-40, "por")

if finished && showing {
	ababa = false
	grrrrr = " aperte para proximo texto "
	if text_index >= array_length(texts)-1 {grrrrr = "aperte para voltar pro inicio " ababa = true}
} else {grrrrr = ""}

draw_text(_x, _y+30, dialoguestring)
draw_text(_x, _y+80, grrrrr)

draw_set_halign(fa_left)
draw_text(70, _y-10, "UTAstra")
draw_set_halign(fa_right)
draw_text(room_width-70, _y-10, "yoisabo")

draw_set_font(fnt_main)