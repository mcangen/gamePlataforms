extends Control

var buttons: Array[Button] = []

@onready var exit_menu = $Exitmatch
@onready var container_exit = $VBoxContainer
@onready var fade = $ColorRect/AnimationPlayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	for child in $VBoxContainer.get_children():
		if child is Button:
			buttons.append(child)
			child.connect("pressed", Callable(self, "_on_button_pressed"))

	if buttons.size() > 0:
		buttons[0].grab_focus()
	fade.play("fade_in")
		
func _unhandled_input(event: InputEvent) -> void:
	# Obtenemos el elemento actualmente enfocado
	var focused_button: Node = get_viewport().gui_get_focus_owner()
	var focused_index: int = buttons.find(focused_button)
	
	# Navegación hacia abajo
	if event.is_action_pressed("move_down") and focused_index != -1:
		var next_index: int = (focused_index + 1) % buttons.size()
		buttons[next_index].grab_focus()
		
	# Navegación hacia arriba
	elif event.is_action_pressed("move_up") and focused_index != -1:
		var previous_index: int = (focused_index - 1 + buttons.size()) % buttons.size()
		buttons[previous_index].grab_focus()
		
	# Activar el botón enfocado
	elif event.is_action_pressed("enter") and focused_button in buttons:
		focused_button.emit_signal("pressed")


func _on_salir_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://Assets/scenes/StartGame.tscn")


func _on_reintentar_pressed() -> void:
	get_tree().paused = false
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://Assets/scenes/level1.tscn")
	
