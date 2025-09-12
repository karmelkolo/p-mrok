extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		%"Obiekt-Sejf1".queue_free()
		$".".queue_free()

func _on_body_entered(body):
	if body is Player:
		%"Obiekt-Sejf1".texture = load('res://Textures/Objects/Safe/Obiekt_-_Sejf_Interakcja.png')
		%"Obiekt-Sejf1".position += Vector2(1,5)
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player && is_instance_valid(%"Obiekt-Sejf1"):
		%"Obiekt-Sejf1".texture = load('res://Textures/Objects/Safe/Obiekt_-_Sejf1.png')
		%"Obiekt-Sejf1".position += Vector2(-1,-5)
		showInteractionLabel = false
