extends Node2D

@export var island_scene: PackedScene
@export var spawn_interval: float = 2.0
@export var spawn_range_min: float = -500.0
@export var spawn_range_max: float = 500.0

var spawn_timer: float = 0.0

func _process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_island()
		spawn_timer = 0.0

func spawn_island() -> void:
	var island = island_scene.instantiate()
	var random_x = randf_range(spawn_range_min, spawn_range_max)
	island.position = Vector2(random_x, position.y)
	add_child(island)
