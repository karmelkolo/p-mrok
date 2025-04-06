extends AudioStreamPlayer2D

@onready var bunkiersfx = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bunkiersfx.play()
