extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["I do not bleed... But everything in me is dying.",
"I'm scared to look at it."]
var dialogue_index = 0
var playing = 0

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and Input.is_action_just_pressed("interact") and dialogue_sprite and dialogue_sprite.currently_playing == -1:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)
	
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
