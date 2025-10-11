extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["Going out onto the battlefield without a detector and a lamp would be suicide."]
var dialogue_index = 0

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel && Input.is_action_just_pressed("interact"):
		if %Player.has_items == 2:
			get_tree().change_scene_to_file("res://Scenes/Surface.tscn")
		else:
			dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
			if dialogue_sprite and dialogue_sprite.currently_playing == -1:
				dialogue_sprite.start(dialogues[dialogue_index], 0.0)

func _on_body_entered(body):
	if body is Player: showInteractionLabel = true

func _on_body_exited(body):
	if body is Player: showInteractionLabel = false
