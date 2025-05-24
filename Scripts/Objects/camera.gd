extends Camera2D

@export var player : Node2D
	
func _physics_process(_delta: float) -> void:
	transform = player.transform
