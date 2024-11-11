extends Control
@onready var sure: Button = $VBoxContainer/sure
@onready var fade = $ColorRect/AnimationPlayer

# Guardamos los botones en una lista para facilitar el manejo del foco
var buttons: Array[Button] = []
func _process(delta: float) -> void:
	exit()
	
func _ready() -> void:
	fade.play("fade_in")
	# Agregamos manualmente todos los hijos de VBoxContainer que son botones a la lista
	for child in $VBoxContainer.get_children():
		if child is Button and child != sure:
			buttons.append(child)
	
	# Aseguramos que el primer botón tenga el foco inicialmente
	if buttons.size() > 0:
		buttons[0].grab_focus()
		
	sure.visible = false
	fade.play("fade_in")
	
# Señales de los botones
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/scenes/level1.tscn")
	fade.play("fade_out")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/scenes/optionsmenu.tscn")
	fade.play("fade_out")
func _on_quit_pressed() -> void:
	sure.visible = true

# Control de entrada para la navegación con teclas
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

# Funcion para salir
func _on_sure_pressed() -> void:
	get_tree().quit()
	fade.play("fade_out")
	
func exit():
	if Input.is_action_just_pressed("back"):
		sure.visible = true
