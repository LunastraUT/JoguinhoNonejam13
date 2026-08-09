if other.collected == false { //coleta
	
		other.collected = true;
	
	if other.harmful == false { //MORRE
		
		global.bolos++
		playSFX(snd_bolin)
	} else {
		morte();
		playSFX(snd_tchuwa)
	}
}