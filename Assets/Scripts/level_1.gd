extends Control

@onready var fade = $ColorRect/AnimationPlayer
@onready var pause = $paused 
@onready var volver_button = $paused/VBoxContainer/volver
@onready var container = $paused/VBoxContainer
@onready var bgcontainer = $paused/ColorRect
func _ready() -> void:
	pause.visible = false
	fade.play("fade_in")

func _physics_process(delta: float) -> void:
	buttons()

func buttons() -> void:
	if Input.is_action_just_pressed("back"): 
		toggle_pause()
	$Resourcelevel/StaticBody2D/AnimationPlayer.play("moviment")

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
