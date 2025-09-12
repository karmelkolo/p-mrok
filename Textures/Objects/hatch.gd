extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		GameState.was_surface = 1
		get_tree().change_scene_to_file("res://Scenes/SafeHouse.tscn")

func _on_body_entered(body):
	if body is Player:
		%"Obiekt-Waz".texture = load('res://Textures/Objects/Hatch/Obiekt_-_WazInterakcja.png')
		%"Obiekt-Waz".position += Vector2(-2,0)
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player && is_instance_valid(%"Obiekt-Waz"):
		%"Obiekt-Waz".texture = load('res://Textures/Objects/Hatch/Obiekt_-_Waz.png')
		%"Obiekt-Waz".position += Vector2(2,0)
		showInteractionLabel = false
