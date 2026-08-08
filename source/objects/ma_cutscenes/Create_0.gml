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
					_dialog.y_target -= 30+10*_dialog.image_yscale
				}
				
				self.box = instance_create_layer(self.pos[0], self.pos[1], "Entities", obj_caixadialogo)
				self.box.text = self.text
				self.box.rabinho_target = self.target
				self.box.right = self.right
				if self.sound != noone {
					audio_play_sound(self.sound, 1, false)	
				}
				
				self.box.reset()
				
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

finish = function() {
	return {
		setup: false,
		caller: id,
		func : function(self)
		{
			if (!self.setup)
			{
				levarparaoproximomundo(self.caller.world_to_go[self.caller.escolha])
			}
			
			return true
		}
	}
}

opcoes = ["Sim", "Não"]
escolha = 0
resposta = ["ebaa", "affff"]
world_to_go = ["world1a", "world1a"]

walking_away = function() {
	waitList(wait(1))
	waitList(player.move(200))
	waitList(finish())
}
final = function() {
	waitList(mix([player.jump(2, escolha+1), spawnDiabox(opcoes[escolha], player, [xx, yy])]))
	waitList(spawnDiabox(resposta[escolha], npc, [xx+70, yy], true))
	
	walking_away()
}

camera = instance_create_depth(0, y+30, depth, obj_camera)
camera.cam_state = camera_states.quotes

player = instance_create_layer(-50, 130, "Entities", obj_cutscenenpc)
npc = instance_create_layer(room_width+50, 130, "Entities" ,obj_cutscenenpc)
npc.olhar = player
npc.cor_gato = global.gatos.amarelo

waitList(mix([player.move(180), npc.move(-180)]))
waitList(wait(1))

xx = 70
yy = (room_height/2)-20

function setUpQuestion(_question, _resposta, _worlds)
{
    world_to_go = _worlds
    resposta = _resposta

    waitList(spawnDiabox(_question, npc, [xx+50, yy], true))

    waitList(spawnQuote(opcoes))
}
change_character = function(_char = "gato") {
	npc.character = _char
	npc.reset()	
}

switch(global.question_data) {
    case "coelha":
		change_character("coelha")
        setUpQuestion(
            "Você gosta de bolo?",
            ["Tente encontrar todos!", "Ah, vou avisar o \npadeiro então..."],
            ["world2a", "world2b"]
        )
    break;
    
    case "raposo":
		walking_away = function() {
			if escolha == 0 {
				waitList(wait(1))
				waitList(player.move(200))
				waitList(finish())
			} else {
				npc.preloaded_animations.walk = spr_raposo_walk_mad
				
				waitList(wait(1))
				waitList(mix([player.move(200), npc.move(-200)]))
				waitList(finish())
			}
		}
		change_character("raposo")
        setUpQuestion(
            "Essas minhas molas são \ntão úteis né?",
            ["Pena que a bateria é\n limitada...", "PFFF... \ntanto faz..."],
            ["world3a", "world3b"]
        )
    break;

    case "cachorro":
		change_character("cachorro")
        setUpQuestion(
            "É verdade que \ntu odeia meus bolos?",
            ["Pode deixar que vou fazer\n de outros sabores \nespecialmente pra você...", "Se safou dessa vez..."],
            ["world3c", "world3d"]
        )
    break;

    case "chip":
		walking_away = function() {
			if escolha == 0 {
				waitList(wait(1))
				waitList(mix([player.move(200), npc.move(200)]))
				waitList(finish())
			} else {
				waitList(wait(1))
				waitList(player.move(200))
				waitList(finish())
			}
		}
		change_character("chip")
        setUpQuestion(
            "Oii! Quer visitar meu \nparque aquático?",
            ["Eba! Cuidado pra não se afogar!", "Oxe gente... \nmas a água está tão boa..."],
            ["world4a", "world4b"]
        )
    break;

    case "rato":
		walking_away = function() {
			if escolha == 1 {
				waitList(wait(1))
				waitList(mix([player.move(200), npc.move(200)]))
				waitList(finish())
			}
		}
		change_character("rato") 
        setUpQuestion(
            "Não cúrtê... môlas...? \nVênhá... mêu labôrátóriô...",
            ["...vamôs nos... divêrtír.", "...é o que todôs dizêm..."],
            ["world4c", "world4d"]
        )
    break;

    case "pato":
		walking_away = function() {
			waitList(wait(1))
			
			if escolha == 0 {
				npc.preloaded_animations.idle = spr_pato_happy
				waitList(mix([player.move(200), npc.move(200)]))
			} else {
				npc.preloaded_animations.idle = spr_pato_sad
				waitList(player.move(200))
			}
			npc.playAnim("idle", true, 0, true)
			
			waitList(finish())
		}
		change_character("pato")
        setUpQuestion(
            "Quack",
            [":)", ":("],
            ["world4e", "world4f"]
        )
    break;

    case "urso":
		walking_away = function() {
			var _viroujanta = false
			if escolha == 1 {
				_viroujanta = true
			} else {
				if global.bolos >= 1 {
					npc.preloaded_animations.bite = spr_ursao_bite2
					player.preloaded_animations.idle = spr_gato_cake
					npc.playAnim("bite", false, 3, true)
					player.playAnim("idle", false)
					waitList(wait(1))
					waitList(spawnDiabox(resposta[escolha], npc, [xx+70, yy], true))
					
					waitList(wait(1))
					waitList(player.move(200))
					waitList(finish())
				} else {
					waitList(spawnDiabox("Hm. Cadê???", npc, [xx+50, yy], true))
					_viroujanta = true
				}
			}
			if _viroujanta {
				npc.preloaded_animations.bite = spr_ursao_bite
				npc.comer = player
				
				waitList(npc.move(25))
				waitList(wait(1))
				waitList(player.move(200))
				waitList(finish())
				
				world_to_go[0] = "world4h"
			}
		}
		
		final = function() {
			if escolha == 1 {waitList(player.jump(2, escolha+1))}
			waitList(spawnDiabox(opcoes[escolha], player, [xx, yy]))
			
			walking_away()
		}
		
		change_character("ursao")
        setUpQuestion(
            "Pode passa esses bolo \npra ka parcero.",
            ["Agora xispa daqui!", "Tabão então..."],
            ["world4g", "world4h"]
        )
    break;
}