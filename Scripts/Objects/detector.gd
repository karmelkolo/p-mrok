extends Area2D
class_name Detector

var showInteractionLabel = false
signal show_detector

var dialogue_sprite: Sprite2D
var dialogues = ["This thing sees more than eyes.",
"The warmth of the skin, the silence in the nerves.",
"They don't scream when infected but this detector hears their silence."]
var dialogue_index = 0

var taken = 0

func _process(_delta: float) -> void:
	if $Label:
		$Label.visible = showInteractionLabel
	
	#IMPLEMENTACJA DIALOGU
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and not taken and Input.is_action_just_pressed("interact") and dialogue_sprite and dialogue_sprite.currently_playing == -1:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self) 
	
	if (showInteractionLabel && Input.is_action_just_pressed("interact") && is_instance_valid(%"Obiekty-Wykrywacz")) || %Player.was_surface == 1:
		if is_instance_valid(%"Obiekty-Wykrywacz"):
			%"Obiekty-Wykrywacz".queue_free()
		if is_instance_valid($Label):
			$Label.queue_free()
		show_detector.emit()
		taken = 1
		%Player.has_items += 1

func _on_body_entered(body):
	if body is Player && is_instance_valid(%"Obiekty-Wykrywacz"):
		%"Obiekty-Wykrywacz".texture = load('res://Textures/Objects/Detector/Obiekty_-_Wykrywacz_Interakcja.png')
		%"Obiekty-Wykrywacz".position += Vector2(1.5,0.5)
		showInteractionLabel = true

func _on_body_exited(body:):
	if body is Player && is_instance_valid(%"Obiekty-Wykrywacz"):
		%"Obiekty-Wykrywacz".texture = load('res://Textures/Objects/Detector/Obiekty_-_Wykrywacz.png')
		%"Obiekty-Wykrywacz".position += Vector2(-1.5,-0.5)
		showInteractionLabel = false
