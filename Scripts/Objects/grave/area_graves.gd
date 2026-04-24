extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["Every single one of them I have seen in the field hospital once.",
"Every single one of them was breathing.",
"Every single one of them said they would come home again.",
"And they all... stayed here, with me."]
var dialogue_index = 0
var canplaydialogue = 0
var inhud = 0

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if showInteractionLabel and Input.is_action_just_pressed("continue") and inhud == 1:
		canplaydialogue += 1
	
	#IMPLEMENTACJA DIALOGU
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and canplaydialogue < 4 and dialogue_sprite and dialogue_sprite.currently_playing == -1:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)
			inhud = 1

func _on_body_entered(body):
	if body is Player:
		showInteractionLabel = true

func _on_body_exited(body):
	if body is Player:
		showInteractionLabel = false
