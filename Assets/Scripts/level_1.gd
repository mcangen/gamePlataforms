extends Control

@onready var fade = $ColorRect/AnimationPlayer
@onready var pause = $paused 
@onready var volver_button = $paused/VBoxContainer/volver
@onready var container = $paused/VBoxContainer
@onready var bgcontainer = $paused/ColorRect
@onready var questionsDie = $Questions
@onready var counter : int
@export var bomb_scene: PackedScene
#<-----------------------

func _ready() -> void:
	pause.visible = false
	fade.play("fade_in")
	$Islandinit/AnimatedSprite2D.play("disappear")
	questionsDie.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	var bomb_instance = bomb_scene.instantiate()
	add_child(bomb_instance)
	bomb_instance.global_position = Vector2(randf_range(0, get_viewport_rect().size.x), 0)
func _physics_process(delta: float) -> void:
	buttons()

func buttons() -> void:
	if Input.is_action_just_pressed("back"): 
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = not get_tree().paused
	pause.visible = get_tree().paused
	if get_tree().paused:
		container.visible = true
		bgcontainer.visible = true
		volver_button.grab_focus() 
	else:
		pause.hide()
		pause.visible = false

func on_character_fall() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	questionsDie.visible = true
	questionsDie.grab_focus()
	var focused_button: Node = get_viewport().gui_get_focus_owner()
	var buttonss: Array[Button] = []
	
	for child in $Questions/Node/VBoxContainer.get_children():
		if child is Button:
			buttonss.append(child)
			child.connect("pressed", Callable(self, "_on_button_pressed"))

	if buttonss.size() > 0:
		buttonss[0].grab_focus()
	
  # Asegúrate de que la escena de preguntas tome el foco

func _on_area_2d_area_entered(area: Area2D) -> void:
	on_character_fall()

func countermoney():
	var counter = 1
	$Control/counter.text = str(counter)
