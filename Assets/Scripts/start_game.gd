extends Control
@onready var sure: Button = $VBoxContainer/sure

# Guardamos los botones en una lista para facilitar el manejo del foco
var buttons: Array[Button] = []

func _ready() -> void:
	# Agregamos manualmente todos los hijos de VBoxContainer que son botones a la lista
	for child in $VBoxContainer.get_children():
		if child is Button and child != sure:
			buttons.append(child)
	
	# Aseguramos que el primer botón tenga el foco inicialmente
	if buttons.size() > 0:
		buttons[0].grab_focus()
		
	sure.visible = false

# Señales de los botones
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/scenes/level1.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/scenes/optionsmenu.tscn")

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
