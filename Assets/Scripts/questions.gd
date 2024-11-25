extends Control

var number_question: int
var answer: int
@onready var fade = $ColorRect2/AnimationPlayer

var buttons: Array[Button] = []

@onready var container_exit = $Node/VBoxContainer
@onready var fadequestion = $Node/ColorRect/AnimationPlayer
@onready var question_label = $Node/question
@onready var result_label = $Node/test

func _ready() -> void:
	for child in container_exit.get_children():
		if child is Button:
			buttons.append(child)
			child.connect("pressed", Callable(self, "_on_button_pressed"))

	if buttons.size() > 0:
		buttons[0].grab_focus()

	fadequestion.play("fade_in")
	randomize()
	question()

func _unhandled_input(event: InputEvent) -> void:
	var focused_button: Node = get_viewport().gui_get_focus_owner()
	var focused_index: int = buttons.find(focused_button)
	
	# if event.is_action_pressed("move_down") and focused_index != -1:
		# var next_index: int = (focused_index + 1) % buttons.size()
		# buttons[next_index].grab_focus()
		
	# elif event.is_action_pressed("move_up") and focused_index != -1:
		# var previous_index: int = (focused_index - 1 + buttons.size()) % buttons.size()
		# buttons[previous_index].grab_focus()
		
	# elif event.is_action_pressed("enter") and focused_button in buttons:
		# focused_button.emit_signal("pressed")

## Preguntas 
func question() -> void:
	number_question = randi() % 26
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
		
	elif number_question == 3:
		question_label.text = "¿Cual es el valor de pi aproximandamente en valores radianes?"
		$Node/VBoxContainer/a.text = "3.1416"
		$Node/VBoxContainer/b.text = "2.16"
		$Node/VBoxContainer/c.text = "100"
		$Node/VBoxContainer/d.text = "180"
		
	elif number_question == 4:
		question_label.text = "¿Que tipo de numero es 2.5?"
		$Node/VBoxContainer/a.text = "Entero"
		$Node/VBoxContainer/b.text = "Racional"
		$Node/VBoxContainer/c.text = "Irracional"
		$Node/VBoxContainer/d.text = "Imaginario"
	
	elif number_question == 5:
		question_label.text = "¿Cuantos grados hay en un circulo?"
		$Node/VBoxContainer/a.text = "90"
		$Node/VBoxContainer/b.text = "180"
		$Node/VBoxContainer/c.text = "360"
		$Node/VBoxContainer/d.text = "540"
		
	elif number_question == 6:
		question_label.text = "Cual es la raiz cuadrada de 64"
		$Node/VBoxContainer/a.text = "6"
		$Node/VBoxContainer/b.text = "7"
		$Node/VBoxContainer/c.text = "8"
		$Node/VBoxContainer/d.text = "9"
	
	elif number_question == 7:
		question_label.text = "¿Que es una hipotenusa?"
		$Node/VBoxContainer/a.text = "El lado mas largo de un trinagulo"
		$Node/VBoxContainer/b.text = "El angulo mas pequeño de un triangulo"
		$Node/VBoxContainer/c.text = "El perimetro de un triangulo"
		$Node/VBoxContainer/d.text = "La altura de un triangulo"
	
	elif number_question == 8:
		question_label.text = "¿Cuanto es 10 al cuadrado?"
		$Node/VBoxContainer/a.text = "100"
		$Node/VBoxContainer/b.text = "1000"
		$Node/VBoxContainer/c.text = "10000"
		$Node/VBoxContainer/d.text = "1"
	
	elif number_question == 9:
		question_label.text = "¿Cual es el valor absoluto de -7?"
		$Node/VBoxContainer/a.text = "-7"
		$Node/VBoxContainer/b.text = "0"
		$Node/VBoxContainer/c.text = "7"
		$Node/VBoxContainer/d.text = "17"
		
	elif number_question == 10:
		question_label.text = "¿Que tipo de funcion consta de una pendiente y un termino independiente?"
		$Node/VBoxContainer/a.text = "Cuadratica"
		$Node/VBoxContainer/b.text = "Lineal"
		$Node/VBoxContainer/c.text = "Exponencial"
		$Node/VBoxContainer/d.text = "Radical"
		
	elif number_question == 11:
		question_label.text = "¿Que tipo de funcion posee solo un termino independiente?"
		$Node/VBoxContainer/a.text = "Lineal"
		$Node/VBoxContainer/b.text = "Cuadratica"
		$Node/VBoxContainer/c.text = "Constante"
		$Node/VBoxContainer/d.text = "Exponencial"
		
	elif number_question == 12:
		question_label.text = "Derivada de x^2"
		$Node/VBoxContainer/a.text = "22^2"
		$Node/VBoxContainer/b.text = "2x"
		$Node/VBoxContainer/c.text = "2x + c"
		$Node/VBoxContainer/d.text = "x^22"
		
	elif number_question == 13:
		question_label.text = "¿Como se llama el metodo de factorizacion que agrupa un coeficiente igual?"
		$Node/VBoxContainer/a.text = "Metodo de laplace"
		$Node/VBoxContainer/b.text = "Metodo de Euler"
		$Node/VBoxContainer/c.text = "Factor Comun"
		$Node/VBoxContainer/d.text = "Diferencia de cuadrado"
		
	elif number_question == 14:
		question_label.text = "3+3+4(3+1)"
		$Node/VBoxContainer/a.text = "40"
		$Node/VBoxContainer/b.text = "21"
		$Node/VBoxContainer/c.text = "10"
		$Node/VBoxContainer/d.text = "22"
	
	elif number_question == 15:
		question_label.text = "¿Cual es el valor de 5 factorial"
		$Node/VBoxContainer/a.text = "15"
		$Node/VBoxContainer/b.text = "50"
		$Node/VBoxContainer/c.text = "120"
		$Node/VBoxContainer/d.text = "720"
		
	elif number_question == 16:
		question_label.text = "Valor 2^4"
		$Node/VBoxContainer/a.text = "2"
		$Node/VBoxContainer/b.text = "16"
		$Node/VBoxContainer/c.text = "4"
		$Node/VBoxContainer/d.text = "8"
		
	elif number_question == 17: 
		question_label.text = "¿Qué es una variable en álgebra?" 
		$Node/VBoxContainer/a.text = "Un número desconocido" 
		$Node/VBoxContainer/b.text = "Un número conocido" 
		$Node/VBoxContainer/c.text = "Una constante" 
		$Node/VBoxContainer/d.text = "Un número desconocido"
	
	elif number_question == 18: 
		question_label.text = "¿Cuál es la fórmula para el perímetro de un rectángulo?"
		$Node/VBoxContainer/a.text = "2(l + w)" 
		$Node/VBoxContainer/b.text = "l x w" 
		$Node/VBoxContainer/c.text = "l^2 + w^2" 
		$Node/VBoxContainer/d.text = "2(l x w)"
		
	elif number_question == 19: 
		question_label.text = "¿Qué es el máximo común divisor (MCD) de 12 y 8?" 
		$Node/VBoxContainer/a.text = "2" 
		$Node/VBoxContainer/b.text = "4" 
		$Node/VBoxContainer/c.text = "6" 
		$Node/VBoxContainer/d.text = "8"
		
	elif number_question == 20: 
		question_label.text = "¿Cuánto es 3/4 + 1/4?" 
		$Node/VBoxContainer/a.text = "1/2" 
		$Node/VBoxContainer/b.text = "1" 
		$Node/VBoxContainer/c.text = "1/4" 
		$Node/VBoxContainer/d.text = "3/4 + 1/4?" 
		
	elif number_question == 21: 
		question_label.text = "¿Qué es el valor de e (aproximadamente)?"
		$Node/VBoxContainer/a.text = "2.18" 
		$Node/VBoxContainer/b.text = "2.71" 
		$Node/VBoxContainer/c.text = "3.14" 
		$Node/VBoxContainer/d.text = "3.41"
	
	elif number_question == 22: 
		question_label.text = "¿Qué tipo de número es √-2?" 
		$Node/VBoxContainer/a.text = "Entero" 
		$Node/VBoxContainer/b.text = "Racional" 
		$Node/VBoxContainer/c.text = "Irracional" 
		$Node/VBoxContainer/d.text = "Imaginario"
		
	elif number_question == 23:
		question_label.text = "Derivada de una constante"
		$Node/VBoxContainer/a.text = "3"
		$Node/VBoxContainer/b.text = "2"
		$Node/VBoxContainer/c.text = "1"
		$Node/VBoxContainer/d.text = "0"
		
	elif number_question == 24: 
		question_label.text = "¿Cuál es la pendiente de la recta y = 2x + 3?" 
		$Node/VBoxContainer/a.text = "1" 
		$Node/VBoxContainer/b.text = "2" 
		$Node/VBoxContainer/c.text = "3" 
		$Node/VBoxContainer/d.text = "4"
		
	elif number_question == 25: 
		question_label.text = "¿Cuál es el termino independiente de la recta y = 16x + 3?" 
		$Node/VBoxContainer/a.text = "17" 
		$Node/VBoxContainer/b.text = "3" 
		$Node/VBoxContainer/c.text = "35" 
		$Node/VBoxContainer/d.text = "16"
		
##Respuestas
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
	
	elif number_question == 3: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
		
	elif number_question == 4: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")

	elif number_question == 5: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 6: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
		
	elif number_question == 7: 
		if answer == 1:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 8: 
		if answer == 1:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 9: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 10: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 11: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 12: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 13: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 14: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 15: 
		if answer == 3:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 16: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 17: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 18: 
		if answer == 1:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 19: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 20: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 21: 
		if answer == 1:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 22: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
			
	elif number_question == 23: 
		if answer == 4:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 24: 
		if answer == 2:
			result_label.text = "Correcta"
		else:
			result_label.text = "Incorrecta"
			get_tree().change_scene_to_file("res://Assets/scenes/exitmatch.tscn")
	
	elif number_question == 25: 
		if answer == 2:
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
