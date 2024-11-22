extends Node2D

var number_question: int
var answer: int

# var buttons: Array[Button] = []

@onready var container_exit = $Node/VBoxContainer
@onready var fadequestion = $Node/ColorRect/AnimationPlayer
@onready var question_label = $Node/question
@onready var result_label = $Node/test

func _ready() -> void:
	# for child in container_exit.get_children():
		# if child is Button:
			# buttons.append(child)
			# child.connect("pressed", Callable(self, "_on_button_pressed"))

	# if buttons.size() > 0:
		# buttons[0].grab_focus()

	fadequestion.play("fade_in")
	randomize()
	question()

# func _unhandled_input(event: InputEvent) -> void:
	# var focused_button: Node = get_viewport().gui_get_focus_owner()
	# var focused_index: int = buttons.find(focused_button)
	
	# if event.is_action_pressed("move_down") and focused_index != -1:
		# var next_index: int = (focused_index + 1) % buttons.size()
		# buttons[next_index].grab_focus()
		
	# elif event.is_action_pressed("move_up") and focused_index != -1:
		# var previous_index: int = (focused_index - 1 + buttons.size()) % buttons.size()
		# buttons[previous_index].grab_focus()
		
	# elif event.is_action_pressed("enter") and focused_button in buttons:
		# focused_button.emit_signal("pressed")

func question() -> void:
	number_question = randi() % 3
	answer = 0

	if number_question == 0:
		question_label.text = "¿Qué ángulo posee un triángulo rectángulo?"
		$Node/VBoxContainer/a.text = "90"
		$Node/VBoxContainer/b.text = "180"
		$Node/VBoxContainer/c.text = "30"
		$Node/VBoxContainer/d.text = "0"
		
	elif number_question == 1:
		question_label.text = "¿Qué triángulo tiene todos los lados iguales?"
		$Node/VBoxContainer/a.text = "Isósceles"
		$Node/VBoxContainer/b.text = "Escaleno"
		$Node/VBoxContainer/c.text = "Obtuso"
		$Node/VBoxContainer/d.text = "Equilátero"
		
	elif number_question == 2:
		question_label.text = "¿A qué es igual el seno?"
		$Node/VBoxContainer/a.text = "Opuesto/Adyacente"
		$Node/VBoxContainer/b.text = "Adyacente/Opuesto"
		$Node/VBoxContainer/c.text = "Opuesto/Hipotenusa"
		$Node/VBoxContainer/d.text = "Hipotenusa/Opuesto"

func responder() -> void:
	if number_question == 0: 
		if answer == 1:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
		
	elif number_question == 1: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 2: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
		
func _on_a_pressed() -> void:
	answer = 1
	responder()
	question()

func _on_b_pressed() -> void:
	answer = 2
	responder()
	question()

func _on_c_pressed() -> void:
	answer = 3
	responder()
	question()

func _on_d_pressed() -> void:
	answer = 4
	responder()
	question()
