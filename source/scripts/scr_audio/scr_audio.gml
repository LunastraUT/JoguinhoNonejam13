function playSFX(_index, _single = false, _priority = 0, _gain = global.sfx_volume, _offset = 0, _pitch = 1)
{
	if _single {
		if audio_is_playing(_index) {
			audio_stop_sound(_index)	
		}
	}
	
	return audio_play_sound(_index, _priority, false, _gain, _offset, _pitch)
}

function playMusic(_index) {
	if audio_is_playing(_index) {
		audio_sound_set_track_position(global.current_music, 0) 
		return
	}
	
	var _music = audio_play_sound(_index, 10, true)
	if global.current_music != noone {audio_sound_gain(global.current_music, 0, 5000)}
	audio_sound_gain(_music, global.music_volume, 5000)
	
	global.current_music = _music
	
	return global.current_music
}

function stopMusic() {
	audio_stop_sound(global.current_music)
}