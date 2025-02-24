extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var trash_tiles: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
signal trash_collected

func _ready():
	randomize_trash_tiles()

func randomize_trash_tiles():
	var random_trash_tile = trash_tiles[randi() % trash_tiles.size()]
	animated_sprite_2d.play(random_trash_tile)

func _on_body_entered(body: Node2D) -> void:
	Signalbus.trash_collected.emit()
	queue_free()
