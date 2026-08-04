function spawnDiabox(_text, _target, _pos = [0, 0], _right = false, _snd = noone) {
	return {
		setup: false,
		text: _text,
		target: _target,
		pos: _pos,
		box: noone,
		right: _right,
		sound: _snd,
		func : function(self)
		{
			if (!self.setup)
			{
				self.box = instance_create_layer(self.pos[0], self.pos[1], "Entities", obj_dialogbox)
				self.box.text = self.text
				self.box.rabinho_target = self.target
				self.box.right = self.right
				if self.sound != noone {
					audio_play_sound(self.sound, 1, false)	
				}
				
				self.setup = true
			}
			
			return self.box.finished
		}
	}
}

camera = instance_create_depth(0, y+30, depth, obj_camera)
camera.cam_state = camera_states.quotes

player = instance_create_layer(-50, 144, "Entities", obj_cutscenenpc)
npc = instance_create_layer(room_width+50, 144, "Entities" ,obj_cutscenenpc)
npc.cor_gato = global.gatos.amarelo

waitList(mix([player.move(180), npc.move(-180)]))
waitList(wait(1))

var _xx = 50
var _yy = (room_height/2)-70
waitList(spawnDiabox("Tung tung tung sahur!", player, [_xx, _yy]))
waitList(spawnDiabox("nao nao", npc, [_xx+70, _yy+30], true))
waitList(spawnDiabox("affff", player, [_xx, _yy+60]))