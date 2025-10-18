extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["Miller, J. T. twenty years... maybe less.",
"He died before he learned to live."]
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
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player:
		showInteractionLabel = false
