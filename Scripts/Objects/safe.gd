extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["I tried everything... it won't budge.",
"Tom had the key but now I don't know where it could be.",
"But its contents Is the only thing that can help me escape."]
var dialogue_index = 0

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	#IMPLEMENTACJA DIALOGU
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and Input.is_action_just_pressed("interact") and dialogue_sprite and dialogue_sprite.currently_playing == -1:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)

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
