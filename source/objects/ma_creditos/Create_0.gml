y_target_bixin = room_height/2
y_bixin = y_target_bixin
y_bixin += 20

finished = false
showing = false
show_timer_max = 20
show_timer = show_timer_max

//texto
grrrrr = ""
ababa = false
texts = [
    "Jogo feito para a NoneJam 13 do tema \nREACAO EM CADEIA ou\nEFEITO BORBOLETA"
    , 
    "experimente tentar outros caminhos se quiser"
]

text_index = 0
text = texts[text_index]
text_color = make_colour_rgb(0, 0, 85)
dialoguestring = ""
max_typing = 0
typing = 0 
timer = 0
time_for_next = 5

tem_todos = true
for(var _i = 0; _i < array_length(global.finais)-1; _i++) {
    if global.finais[_i] == 0 {tem_todos = false}
}

if tem_todos {
    texts = [
        "Jogo feito para a NoneJam 13 do tema \nREACAO EM CADEIA ou\nEFEITO BORBOLETA"
        , 
        "Parabens! \nvoce fez todos caminhos possiveis!"
    ]    
}

reset = function() {
    finished = false
    
    text = texts[text_index]
    dialoguestring = ""
    max_typing = string_length(text)
    typing = 0 
    timer = 0
}
reset()