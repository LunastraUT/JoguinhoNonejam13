  global.levels = ds_map_create()
   
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
        go_to: rm_question,
        question_data: "world1a"
    },
]
    
   
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
        go_to: rm_question,
        question_data: "world2a"
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
        go_to: rm_question,
        question_data: "world2b"
    },
]

global.question_data = "tung"

global.world = global.levels[? "world1a"]
global.level = global.world[0]

function levarparaoproximolevel() {
	transRights(global.level.go_to)
	
	var _next = array_get_index(global.world, global.level)+1
	if array_length(global.world) <= _next {
		global.question_data = global.level.question_data
	} else {
		global.level = global.world[_next]	
	}
}

function levarparaoproximomundo(_mundo) {
	global.world = global.levels[? _mundo]
	global.level = global.world[0]

	transRights(global.level.room_level)
}