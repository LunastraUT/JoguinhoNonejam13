if !collected {
	playSFX(snd_key, false, 0, global.sfx_volume, 0, 1.5)

	var _maisperto = instance_nearest(x, y, obj_bloco_da_chave)
	if _maisperto {
		_maisperto.morteinstantanea()
	}
	
	collected = true
}