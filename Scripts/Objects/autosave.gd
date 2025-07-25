extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		save_game()

func save_game():
