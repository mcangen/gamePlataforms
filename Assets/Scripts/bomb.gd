extends Node2D

@onready var animation = $RigidBody2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("on")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	animation.play("explode")
	
func _on_animated_sprite_2d_animation_finished() -> void:
		queue_free()
