extends Node

var trash = preload("res://scenes/trash.tscn")
@export var trash_count: int = 200  # Number of trash items to generate
@export var map_area: Rect2 = Rect2(Vector2(0, 0), Vector2(1152, 768))  # Define map bounds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_trash()

func generate_trash():
	for i in trash_count:
		var trash_instance = trash.instantiate()
		
		randomize()
		var rand_x = randi_range(1, map_area.size.x)
		var rand_y = randf_range(1, map_area.size.x)
		
		trash_instance.position = Vector2(rand_x, rand_y)
		
		add_child(trash_instance)
	
