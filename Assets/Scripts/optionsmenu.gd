extends Control
@onready var info_label = $infoLabel
@onready var volume_slider = $HSlider
@onready var audio_player = $AudioStreamPlayer2D
@onready var mute_button = $VBoxContainer/muteButton
@onready var fade = $ColorRect/AnimationPlayer

# Variable para almacenar el estado del volumen
var is_muted: bool = false
# Guardamos los botones en una lista para facilitar el manejo del foco
var buttons: Array[Button] = []
func _process(delta: float) -> void:
	back()
func _ready() -> void:
	# Agregamos manualmente todos los hijos de VBoxContainer que son botones a la lista
	for child in $VBoxContainer.get_children():
		if child is Button and child.name != "muteButton":
			buttons.append(child)
	
	# Aseguramos que el primer botón tenga el foco inicialmente
	if buttons.size() > 0:
		buttons[0].grab_focus()
	
	# Escondemos el label, el slider y el botón de mute al inicio
	info_label.visible = false
	volume_slider.visible = false
	mute_button.visible = false
	fade.play("fade_in")

# Señales de los botones
func _on_info_pressed() -> void:
	info_label.text = "En un mundo de plataformas flotantes y desafíos sin fin,\n el jugador asume el papel de un aventurero intrépido que debe \n recolectar la mayor cantidad de monedas posible mientras \n esquiva peligros a cada paso.\n La misión parece sencilla, pero en este mundo, un solo error \n puede llevar a consecuencias inesperadas.\n Si el jugador cae, no es el final, sino el comienzo de una prueba\n en un reino misterioso similar al limbo, donde el tiempo y el espacio se \ndistorsionan. En este lugar sombrío, lleno de obstáculos y trampas ocultas, \nel jugador debe encontrar una puerta mística que es la única salida \na la realidad. Sin embargo, la puerta guarda un secreto:\nun acertijo matemático que debe ser resuelto para escapar.\n Si el jugador logra resolver el enigma, regresa al mundo de las plataformas\n con todas sus monedas, listo para continuar la búsqueda de riqueza.\n Pero si falla, el limbo no perdona; el aventurero se desvanecerá,\n perdiéndose para siempre en la oscuridad.\n ¿Hasta dónde llegarás? \n ¿Cuántas monedas podrás acumular antes de que el limbo intente atraparte?"
	info_label.visible = true
	volume_slider.visible = false
	mute_button.visible = false

func _on_volumen_pressed() -> void:
	info_label.visible = false
	volume_slider.visible = false
	mute_button.visible = true

func _on_mute_button_pressed() -> void:
	is_muted = not is_muted
	if is_muted:
		audio_player.volume_db = -80 # Silenciar el volumen
		mute_button.text = "ACTIVAR VOL"
	else:
		audio_player.volume_db = volume_slider.value # Restaurar el volumen al valor del slider
		mute_button.text = "DESACTIVAR VOL"

func _on_volume_slider_value_changed(value: float) -> void:
	if not is_muted:
		audio_player.volume_db = value

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/scenes/StartGame.tscn")

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
	
	# Activar/Desactivar volumen
	elif event.is_action_pressed("ui_toggle_mute") and event.is_pressed():
		_on_mute_button_pressed()

func back():
	if Input.is_action_pressed("back"):
		get_tree().change_scene_to_file("res://Assets/scenes/StartGame.tscn")
