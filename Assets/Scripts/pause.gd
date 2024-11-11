extends Control

var buttons: Array[Button] = []

@onready var pause_menu = $paused
@onready var container = $VBoxContainer
@onready var bgcontainer = $ColorRect 

func _ready() -> void:
	for child in $VBoxContainer.get_children():
		if child is Button:
			buttons.append(child)
			child.connect("pressed", Callable(self, "_on_button_pressed"))

	if buttons.size() > 0:
		buttons[0].grab_focus()

func _unhandled_input(event: InputEvent) -> void:
	var focused_button: Node = get_viewport().gui_get_focus_owner()
	var focused_index: int = buttons.find(focused_button)

	if event.is_action_pressed("move_down") and focused_index != -1:
		var next_index: int = (focused_index + 1) % buttons.size()
		buttons[next_index].grab_focus()

	elif event.is_action_pressed("move_up") and focused_index != -1:
		var previous_index: int = (focused_index - 1 + buttons.size()) % buttons.size()
		buttons[previous_index].grab_focus()

	elif event.is_action_pressed("enter") and focused_button in buttons:
		focused_button.emit_signal("pressed")

func _on_volver_pressed() -> void: 
	get_tree().paused = false
	container.visible = false
	bgcontainer.visible = false
	
	if pause_menu: 
		if pause_menu.visible:
			pause_menu.visible = false 
		
func _on_repetir_pressed() -> void: 
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_salir_pressed() -> void: 
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://Assets/scenes/StartGame.tscn")
	
