event_inherited()

timers()

final_hsp = hsp*spd
final_vsp = vsp 

updateCollision()

indexcor += keyboard_check_pressed(ord("A")) - keyboard_check_pressed(ord("D"))
indexcor = clamp(indexcor, 0, array_length(tantodegato))
cor_gato = tantodegato[indexcor]