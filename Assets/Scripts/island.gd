extends StaticBody2D

@onready var life_timer = $LifeTimer

func _ready() -> void:
	life_timer.connect("timeout", Callable(self, "_on_life_timer_timeout"))
	life_timer.start()

func _on_life_timer_timeout() -> void:
	queue_free()  # Eliminar la isla de la escena
