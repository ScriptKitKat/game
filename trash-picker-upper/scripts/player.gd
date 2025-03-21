extends CharacterBody2D

const SPEED = 75.0
const ACCEL = 2.0

var global
var input: Vector2
var lastMove = "down"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	global = get_node("/root/Global")

func is_player():
	pass

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()

func _process(delta: float):
	current_camera()
	var direction = get_input()

	velocity = direction * SPEED
	
	move_and_slide()
	
	if (velocity.length() > 0):
		play_movement_animation(direction)
	else:
		play_idle_animation()

func play_movement_animation(direction: Vector2) -> void:
	if abs(direction.x) > abs(direction.y):
		animated_sprite_2d.play("movement-lr")
		animated_sprite_2d.flip_h = direction.x < 0;
		lastMove = "lr"
	elif direction.y < 0:
		animated_sprite_2d.play("movement-up")
		lastMove = "up"
	else:
		animated_sprite_2d.play("movement-down")
		lastMove = "down"

func play_idle_animation() -> void:
	if lastMove == "up":
		animated_sprite_2d.play("idle-up")
	elif lastMove == "down":
		animated_sprite_2d.play("idle-down")
	elif lastMove == "lr":
		animated_sprite_2d.play("idle-lr");

func current_camera() -> void:
	if global.current_scene == "world":
		$startCamera.enabled = true
		$dungeon1Camera.enabled = false
	elif global.current_scene == "dungeon_1":
		$startCamera.enabled = false
		$dungeon1Camera.enabled = true
