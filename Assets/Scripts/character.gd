extends CharacterBody2D

@export var move_speed:  float
@export var jump_speed: float
var is_facing_right = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $Sprite2D
@onready var animated_sprite = $Sprite2D/AnimatedSprite2D
@onready var area = $Area2D
#<-----------------------

func _ready() -> void:
	area.connect("area_entered", Callable(self, "_on_area_entered"))

#func _on_area_entered(area: Area2D) -> void: 
	#if area.name == "Suelo": 
		#get_node("res://Assets/scenes/level1.tscn").on_character_fall()
		
func _physics_process(delta):
	move_x()
	flip()
	move_and_slide()
	jump(delta)
	update_animations()
	
func move_x():
	var input_axis = Input.get_axis("move_left", "move_right")
	velocity.x = input_axis * move_speed

func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0 ):
		sprite.scale.x *= -scale.x
		is_facing_right = not is_facing_right
		
func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	if not is_on_floor():
		velocity.y += gravity * delta
	is_on_floor()
	
func update_animations():
	#if not is_on_floor():
	#	if velocity.y < 0 :
	#		animated_sprite.play("jump"), pronto vemos como ponemos animated jum	
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Suelo": 
		var mundo = get_node("/root/Mundo") 
		if mundo: mundo.on_character_fall()
		
