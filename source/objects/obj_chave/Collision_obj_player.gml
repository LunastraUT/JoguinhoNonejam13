if !self.collected {
	//playSFX(snd_key)
	
	other.keyPerLevelValue += 1;
	playSFX(snd_key, false, 0, global.sfx_volume, 0,
	((1 - 0.005 * quantaschaveporra) + other.keyPerLevelValue * 0.05));
	
	self.collected = true
	
}