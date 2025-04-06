extends AudioStreamPlayer2D

@onready var mainsfx = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainsfx.play()
