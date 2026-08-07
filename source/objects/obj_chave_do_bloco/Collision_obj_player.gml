if !collected {
	playSFX(snd_key)

	var _maisperto = instance_nearest(x, y, obj_bloco_da_chave)
	if _maisperto {
		_maisperto.morteinstantanea()
	}
	
	collected = true
}