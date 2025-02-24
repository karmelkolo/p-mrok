extends Camera2D

var player : Node2D

func _ready() -> void:
	player = %Player
	
func _physics_process(_delta: float) -> void:
	transform = player.transform
