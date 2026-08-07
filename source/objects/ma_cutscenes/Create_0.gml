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
				for(var _dia = 0; _dia < instance_number(obj_caixadialogo); _dia++) {
					var _dialog = instance_find(obj_caixadialogo, _dia)
					_dialog.y_target -= 20	
				}
				
				self.box = instance_create_layer(self.pos[0], self.pos[1], "Entities", obj_caixadialogo)
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

function spawnQuote(_opcoes) {
	return {
		setup: false,
		options: _opcoes,
		func : function(self)
		{
			if (!self.setup)
			{
				self.box = instance_create_depth(room_width/2, 150, -999, obj_caixadialogo_pergunta)
				self.box.options = [{text: self.options[0]}, {text: self.options[1]}]
				self.box.reset()
				
				self.setup = true
			}
			
			return self.box.finished
		}
	}
}

opcoes = ["SIM", "NAO"]
escolha = 0
resposta = ["ebaa", "affff"]

final = function() {
	waitList(mix([player.jump(2, escolha+1), spawnDiabox(opcoes[escolha], player, [xx, yy])]))
	waitList(spawnDiabox(resposta[escolha], npc, [xx+70, yy], true))
	
	waitList(wait(1))
	waitList(player.move(200))
}

camera = instance_create_depth(0, y+30, depth, obj_camera)
camera.cam_state = camera_states.quotes

player = instance_create_layer(-50, 144, "Entities", obj_cutscenenpc)
npc = instance_create_layer(room_width+50, 144, "Entities" ,obj_cutscenenpc)
npc.cor_gato = global.gatos.amarelo

waitList(mix([player.move(180), npc.move(-180)]))
waitList(wait(1))

xx = 50
yy = (room_height/2)-20

switch(global.question_data) {
	case "tung":
		waitList(spawnDiabox("vc gosta de roblox?", npc, [xx+70, yy], true))

		waitList(spawnQuote(opcoes))
	break;
}
