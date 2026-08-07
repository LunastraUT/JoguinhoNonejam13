draw_set_alpha(alpha)

draw_self()
draw_set_colour(text_color)
draw_text(x+7, y+8, dialoguestring)

//Rabinho
rabinho_origem = x+15

if right { 
	rabinho_origem = x+sprite_width-30
	_offsetaffpreguicaveyr = 0
}

var _y1 = y+sprite_height-2
var _x2 = rabinho_origem+12
var _x3 = rabinho_target.x
var _y3 = rabinho_target.y
_x3 = clamp(_x3, rabinho_origem-30, rabinho_origem+30)
_y3 = clamp(_y3, _y1, _y1+10)
var _outline = 3

draw_line_width(rabinho_origem, _y1+1, _x3, _y3, _outline)
draw_line_width(_x3, _y1+1, _x3, _y3, _outline)

draw_set_colour(c_white)
draw_triangle(rabinho_origem, _y1, _x3, _y1, _x3, _y3-1, false)

draw_set_alpha(1)