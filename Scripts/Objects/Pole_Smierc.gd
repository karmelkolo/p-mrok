extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print_debug("test")
		get_tree().unload_current_scene()
		get_tree().change_scene_to_file("res://Scenes/Smierc.tscn")
