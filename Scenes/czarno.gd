extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_mouse_entered() -> void:
	$Czarno.visible = false; 



func _on_mouse_exited() -> void:
	$Czarno.visible = true; 
