extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	get_tree().change_scene_to_file("res://Scenes/SafeHouse.tscn")
