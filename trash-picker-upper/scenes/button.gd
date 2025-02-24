extends Button

@onready var river_tilemap = $"../TileMap/water" # Adjust path to your TileMap
@onready var shader_material = river_tilemap.material as ShaderMaterial

var is_clean = false
var tween: Tween

func _ready():
	self.pressed.connect(_on_switch_pressed)
	shader_material.set_shader_parameter("color_water", Color(0.1, 0.5, 1.0, 1.0))  # Start as polluted

func _on_switch_pressed():
	is_clean = !is_clean
	var target_value = Color(0.3, 0.2, 0.1, 1.0) if is_clean else Color(0.1, 0.5, 1.0, 1.0)  # 0 = clean, 1 = polluted
	tween_pollution(target_value)

func tween_pollution(target_value):
	if tween:
		tween.kill()  # Stop previous tweens
	tween = create_tween()
	tween.tween_property(shader_material, "shader_parameter/color_water", target_value, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
