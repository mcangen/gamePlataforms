extends Node2D
func _physics_process(delta):
	buttons()
	
func buttons():
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://Assets/scenes/StartGame.tscn")
