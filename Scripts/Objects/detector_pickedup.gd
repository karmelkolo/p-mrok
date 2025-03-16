extends TextureRect

var camera : Node2D

func _ready() -> void:
	visible = false
	camera = %Camera
	
func _process(_delta: float) -> void:
	var new_position = camera.position + Vector2(59,59)
	
	new_position.x = clamp(new_position.x, 118, 512)
	new_position.y = clamp(new_position.y, 118, 512)
	
	position = new_position
