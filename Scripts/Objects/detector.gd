extends Area2D
class_name Detector

var showInteractionLabel = false
signal show_detector

var dialogue_sprite: Sprite2D
var dialogues = ["This thing sees more than eyes.",
"The warmth of the skin, the silence in the nerves.",
"They don't scream when infected but this detector hears their silence."]
var dialogue_index = 0

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if (showInteractionLabel && Input.is_action_just_pressed("interact")) || %Player.was_surface == 1:
		%"Obiekty-Wykrywacz".queue_free()
		queue_free()
		show_detector.emit()
		%Player.has_items += 1

func _on_body_entered(body):
	if body is Player:
		%"Obiekty-Wykrywacz".texture = load('res://Textures/Objects/Detector/Obiekty_-_Wykrywacz_Interakcja.png')
		%"Obiekty-Wykrywacz".position += Vector2(1.5,0.5)
		showInteractionLabel = true

func _on_body_exited(body:):
	if body is Player && is_instance_valid(%"Obiekty-Wykrywacz"):
		%"Obiekty-Wykrywacz".texture = load('res://Textures/Objects/Detector/Obiekty_-_Wykrywacz.png')
		%"Obiekty-Wykrywacz".position += Vector2(-1.5,-0.5)
		showInteractionLabel = false
