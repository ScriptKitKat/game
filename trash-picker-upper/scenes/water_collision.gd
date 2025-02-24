extends TileMapLayer

@export var pollution_layer: int = 2  # Layer for pollution collision
@export var river_layer: int = 1  # Layer for river visuals
@export var collision_source_id: int  # Source ID of the tile containing collision
@export var collision_atlas_coords: Vector2i  # Atlas coordinates for the collision tile

var is_clean = false  # Track pollution state

func _ready():
	update_pollution()  # Ensure correct state on game start

func toggle_pollution():
	is_clean = !is_clean
	#update_pollution()

func update_pollution():
	if is_clean:
		$".".tile_set.set_physics_layer_collision_layer(0,0)  # Disable collisions
	else:
		$".".tile_set.set_physics_layer_collision_layer(2,2)   # Enable collisions
