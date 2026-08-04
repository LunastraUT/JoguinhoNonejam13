// Inherit the parent event
event_inherited();

skew = lerp(skew, skew_max, 0.8)
hsp = lerp(hsp, spd, 0.1)
x += hsp

if spd != 0 {
	looking_at = sign(hsp)
	skew_max = -3*hsp
	playAnim("walk", true)	
} else {
	skew_max = 0
	playAnim("idle", true)	
}