extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
var trash_tiles: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
var player_in_area: bool = false  

signal trash_collected

func _ready():
	randomize_trash_tiles()

func randomize_trash_tiles():
	var random_trash_tile = trash_tiles[randi() % trash_tiles.size()]
	animated_sprite_2d.play(random_trash_tile)

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("pick_up"):  # "pick_up" should be mapped to "x" in Input Map
		pickup_trash()

func pickup_trash():
	Signalbus.trash_collected.emit()
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hello")
	if body.has_method("is_player"):
		player_in_area = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("is_player"):
		player_in_area = false
