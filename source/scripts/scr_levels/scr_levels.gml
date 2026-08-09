global.levels = ds_map_create()

#region WORLD 1
	global.levels[? "world1a"] = [ // MUNDO 1
	    { // 1a
	        room_level: rm_lv1_a,
	        go_to: rm_lv2_a
	    },
	    { // 2a
	        room_level: rm_lv2_a,
	        go_to: rm_lv3_a
	    },
	    { // 3a
	        room_level: rm_lv3_a,
	        go_to: rm_question_coelha,
	        question_data: "coelha"
	    },
	]
#endregion

#region WORLD 2
	global.levels[? "world2a"] = [  // MUNDO 2
	    { // 4a
	        room_level: rm_lv4_a,
	        go_to: rm_lv5_a
	    },
	    { // 5a
	        room_level: rm_lv5_a,
	        go_to: rm_lv6_a
	    },
	    { // 6a
	        room_level: rm_lv6_a,
	        go_to: rm_question_raposo,
	        question_data: "raposo"
	    },
	]
	global.levels[? "world2b"] = [ 
	    { // 4b
	        room_level: rm_lv4_b,
	        go_to: rm_lv5_b
	    },
	    { // 5b O_O
	        room_level: rm_lv5_b,
	        go_to: rm_lv6_b
	    },
	    { // 6b
	        room_level: rm_lv6_b,
	        go_to: rm_question_cachorro,
	        question_data: "cachorro"
	    },
	]
#endregion

#region WORLD 3
	global.levels[? "world3a"] = [ 
	    { // 7a
	        room_level: rm_lv7_a,
	        go_to: rm_lv8_a
	    },
	    { // 8a
	        room_level: rm_lv8_a,
	        go_to: rm_lv9_a
	    },
	    { // 9a
	        room_level: rm_lv9_a,
	        go_to: rm_question_chip,
	        question_data: "chip"
	    },
	]
	global.levels[? "world3b"] = [ 
	    { // 7b
	        room_level: rm_lv7_b,
	        go_to: rm_lv8_b
	    },
	    { // 8b
	        room_level: rm_lv8_b,
	        go_to: rm_lv9_b
	    },
	    { // 9b
	        room_level: rm_lv9_b,
	        go_to: rm_question_rato,
	        question_data: "rato"
	    },
	]
	global.levels[? "world3c"] = [ 
	    { // 7c
	        room_level: rm_lv7_c,
	        go_to: rm_lv8_c
	    },
	    { // 8c
	        room_level: rm_lv8_c,
	        go_to: rm_lv9_c
	    },
	    { // 9c
	        room_level: rm_lv9_c,
	        go_to: rm_question_pato,
	        question_data: "pato"
	    },
	]
	global.levels[? "world3d"] = [ 
	    { // 7d
	        room_level: rm_lv7_d,
	        go_to: rm_lv8_d
	    },
	    { // 8d
	        room_level: rm_lv8_d,
	        go_to: rm_lv9_d
	    },
	    { // 9d
	        room_level: rm_lv9_d,
	        go_to: rm_question_urso,
	        question_data: "urso"
	    },
	]
#endregion

#region WORLD 4
	global.levels[? "world4a"] = [ 
	    { // 10a
	        room_level: rm_lv10_a,
	        go_to: rm_lv11_a
	    },
	    { // 11a
	        room_level: rm_lv11_a,
	        go_to: rm_lv12_a
	    },
	    { // 12a
	        room_level: rm_lv12_a,
	        go_to: rm_cutscene_final,
	        question_data: "A"
	    },
	]
	global.levels[? "world4b"] = [ 
	    { // 10b
	        room_level: rm_lv10_b,
	        go_to: rm_lv11_b
	    },
	    { // 11b
	        room_level: rm_lv11_b,
	        go_to: rm_lv12_b
	    },
	    { // 12b
	        room_level: rm_lv12_b,
	        go_to: rm_cutscene_final,
	        question_data: "B"
	    },
	]
	global.levels[? "world4c"] = [ 
	    { // 10c
	        room_level: rm_lv10_c,
	        go_to: rm_lv11_c
	    },
	    { // 11c
	        room_level: rm_lv11_c,
	        go_to: rm_lv12_c
	    },
	    { // 12c
	        room_level: rm_lv12_c,
	        go_to: rm_cutscene_final,
	        question_data: "C"
	    },
	]
	global.levels[? "world4d"] = [ 
	    { // 10d
	        room_level: rm_lv10_d,
	        go_to: rm_lv11_d
	    },
	    { // 11d
	        room_level: rm_lv11_d,
	        go_to: rm_lv12_d
	    },
	    { // 12d
	        room_level: rm_lv12_d,
	        go_to: rm_cutscene_final,
	        question_data: "D"
	    },
	]
	global.levels[? "world4e"] = [ 
	    { // 10e
	        room_level: rm_lv10_e,
	        go_to: rm_lv11_e
	    },
	    { // 11e
	        room_level: rm_lv11_e,
	        go_to: rm_lv12_e
	    },
	    { // 12e
	        room_level: rm_lv12_e,
	        go_to: rm_cutscene_final,
	        question_data: "E"
	    },
	]
	global.levels[? "world4f"] = [ 
	    { // 10f
	        room_level: rm_lv10_f,
	        go_to: rm_lv11_f
	    },
	    { // 11f
	        room_level: rm_lv11_f,
	        go_to: rm_lv12_f
	    },
	    { // 12f
	        room_level: rm_lv12_f,
	        go_to: rm_cutscene_final,
	        question_data: "F"
	    },
	]
	global.levels[? "world4g"] = [ 
	    { // 10g
	        room_level: rm_lv10_g,
	        go_to: rm_lv11_g
	    },
	    { // 11g
	        room_level: rm_lv11_g,
	        go_to: rm_lv12_g
	    },
	    { // 12g
	        room_level: rm_lv12_g,
	        go_to: rm_cutscene_final,
	        question_data: "G"
	    },
	]
	global.levels[? "world4h"] = [ 
	    { // 10h
	        room_level: rm_lv10_h,
	        go_to: rm_lv11_h
	    },
	    { // 11h
	        room_level: rm_lv11_h,
	        go_to: rm_lv12_h
	    },
	    { // 12h
	        room_level: rm_lv12_h,
	        go_to: rm_cutscene_final,
	        question_data: "H"
	    },
	]
#endregion

global.question_data = "rato"

global.world = global.levels[? "world1a"]
global.level = global.world[0]

function levarparaoproximolevel() {
	var _nextRoom = global.level.go_to
	if room == rm_menu {_nextRoom = rm_lv1_a} //preguica gambiarrar
	transRights(_nextRoom)
	
	var _next = array_get_index(global.world, global.level)+1
	if array_length(global.world) <= _next {
		global.question_data = global.level.question_data
	} else {
		if room == rm_menu {_next = 0}
		
		global.level = global.world[_next]	
	}
}

function levarparaoproximomundo(_mundo) {
	global.world = global.levels[? _mundo]
	global.level = global.world[0]

	transRights(global.level.room_level)
}