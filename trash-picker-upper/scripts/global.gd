extends Node

var current_scene = "world"
var transition_scene = false

var player_exit_dungeon1_posx = 0
var player_exit_dungeon1_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changingscenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "dungeon_1"
		elif current_scene == "dungeon1":
			current_scene = "world"
		else:
			current_scene = "world"
