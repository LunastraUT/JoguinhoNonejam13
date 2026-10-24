if other.collected == false { //coleta
	hud.conta_bolo.show()
	
	other.collected = true;
	
	if other.harmful == false { //MORRE
		
		global.bolos++
		playSFX(snd_bolin)
	} else {
		morte();
		playSFX(snd_tchuwa)
	}
}