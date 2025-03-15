extends Node

var trash = preload("res://scenes/trash.tscn")
@export var trash_count: int = 200  # Number of trash items to generate
@export var map_area: Rect2 = Rect2(Vector2(0, 0), Vector2(1152, 768))  # Define map bounds

var global

func _ready() -> void:
	global = get_node("/root/Global")
	generate_trash()

func _process(delta: float) -> void:
	change_scene()

func generate_trash():
	for i in trash_count:
		var trash_instance = trash.instantiate()
		
		randomize()
		var rand_x = randi_range(1, map_area.size.x)
		var rand_y = randf_range(1, map_area.size.x)
		
		trash_instance.position = Vector2(rand_x, rand_y)
		
		add_child(trash_instance)

# func _on_dungeon_1_transition_point_body_exited(body:Node2D) -> void:
# 	if body.has_method("player"):
# 		global.transition_scene = false

func _on_dungeon_1_transition_point_body_entered(body:Node2D) -> void:
	if body.has_method("is_player"):
		print("Player entered dungeon 1 transition point")
		global.transition_scene = true

func change_scene():
	if global.transition_scene == true:
		print("Changing scene")
		if global.current_scene == "world":
			print("Changing to dungeon 1")
			get_tree().change_scene_to_file("res://scenes/dungeon_1.tscn")
			global.finish_changingscenes()
