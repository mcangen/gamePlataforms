extends ParallaxBackground
@export var velocidad : int
func _process(delta):
	
	scroll_offset.x -= velocidad * delta
