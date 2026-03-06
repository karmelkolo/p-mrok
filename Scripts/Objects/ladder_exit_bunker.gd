extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["Going out onto the battlefield without a detector and a lamp would be suicide."]
var dialogue_index = 0
var block_input = false

func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and Input.is_action_just_pressed("interact") and (%Player.has_items == 2 or GameState.was_surface == 1):
		%Player.can_move = false
		var entrysfx = AudioStreamPlayer2D.new()
		add_child(entrysfx)
		entrysfx.stream = load("res://Audio/sfx/bunkier_klapa.mp3")
		entrysfx.play()
		await get_tree().create_timer(1).timeout
		entrysfx.finished.connect(entrysfx.queue_free)
		%Player.can_move = true
		get_tree().change_scene_to_file("res://Scenes/Surface.tscn")
	elif showInteractionLabel and Input.is_action_just_pressed("interact") and dialogue_sprite and dialogue_sprite.currently_playing == -1:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)
		

func _on_body_entered(body):
	if body is Player: showInteractionLabel = true

func _on_body_exited(body):
	if body is Player: showInteractionLabel = false
