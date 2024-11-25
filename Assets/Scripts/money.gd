extends Node2D

signal coinCollected

func _ready() -> void:
	add_to_group("Money")
	$Area2D/AnimationPlayer.play("money")

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Se detectó una colisión con el Area2D")
	queue_free()
	emit_signal("coinCollected")
