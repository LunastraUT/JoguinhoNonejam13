destroying = false
if (instance_number(obj_chave_do_bloco) == 1) {
	destroy_time = obj_chave_do_bloco.destroy_time;
} else {
	destroy_time = 8;
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