destroying = false

destroy_time = 8;

switch(room) {
    case rm_lv7_d:
        destroy_time = 16;
    break;
    case rm_lv8_d:
        destroy_time = 8;
    break;
    case rm_lv9_d:
        destroy_time = 10;
    break;
    case rm_lv10_g:
        destroy_time = 8;
    break;
    case rm_lv11_g:
        destroy_time = 8;
    break;
    case rm_lv12_g:
        destroy_time = 8;
    break;
    
}


function morteinstantanea() { //deve ter um jeito melhor mas eu to com sono
    if (destroying) return
    destroying = true

    var tam = 16
    var b = noone

    // Esquerda
    b = instance_place(x - tam, y, obj_bloco_da_chave)
    if (b != noone) b.alarm[0] = destroy_time

    // Direita
    b = instance_place(x + tam, y, obj_bloco_da_chave)
    if (b != noone) b.alarm[0] = destroy_time

    // Cima
    b = instance_place(x, y - tam, obj_bloco_da_chave)
    if (b != noone) b.alarm[0] = destroy_time

    b = instance_place(x, y + tam, obj_bloco_da_chave)
    if (b != noone) b.alarm[0] = destroy_time

    spawnParticles(x+sprite_width/2, y+sprite_height/2, "roundpuff", 3)
    instance_destroy()
}