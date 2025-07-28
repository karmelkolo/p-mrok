extends Area2D

var showInteractionLabel = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		#Usuwanie obiektu, tu będzie odpalenie sceny przyglądania się w lustrze
		%"Obiekt-Lustro1".queue_free()
		$".".queue_free()

func _on_body_entered(body):
	if body is Player:
		%"Obiekt-Lustro1".texture = load('res://Textures/Objects/Mirror/Obiekt_-_Lustro_Interakcja.png')
		%"Obiekt-Lustro1".position += Vector2(0,2)
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player && is_instance_valid(%"Obiekt-Lustro1"):
		%"Obiekt-Lustro1".texture = load('res://Textures/Objects/Mirror/Obiekt_-_Lustro1.png')
		%"Obiekt-Lustro1".position += Vector2(0,-2)
		showInteractionLabel = false
