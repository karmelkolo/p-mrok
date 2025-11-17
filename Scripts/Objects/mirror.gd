extends Area2D

var showInteractionLabel = false

var dialogue_sprite: Sprite2D
var dialogues = ["I do not bleed... But everything in me is dying.",
"I'm scared to look at it."]
var dialogue_index = 0
var dialogue_over = false

var choice_index = 0 # 0 = A, 1 = B
var choosing = false
var block_input = false
var mirror = false
var block_choice = false
	
func _process(_delta: float) -> void:
	$Label.visible = showInteractionLabel
	
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and Input.is_action_just_pressed("interact") and dialogue_sprite and dialogue_sprite.currently_playing == -1 and not dialogue_over:
		mirror = true
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)
			choosing = false
		
	if dialogue_over and Input.is_action_just_pressed("continue") and not choosing and not block_choice and mirror:
		mirror = false
		choice()
		
		
func choice():
	dialogue_over = false
	choosing = true
	%Player.can_move = false
	$"../HUD/HUD_Layer/Mirror/FadeOut".fade_in()
	block_input = true
	await get_tree().create_timer(2.0).timeout
	block_input = false
	
	$"../HUD/HUD_Layer/Mirror/A".visible = true
	$"../HUD/HUD_Layer/Mirror/B".visible = true
	choice_visual()
	
func choice_visual():
	var hud = get_tree().get_root().find_child("HUD", true, false)
	var see = hud.get_node("HUD_Layer/Mirror/A")
	var leave = hud.get_node("HUD_Layer/Mirror/B")

	if choice_index == 0:
		see.modulate = Color.WHITE
		leave.modulate = Color(0.5, 0.5, 0.5)
	else:
		see.modulate = Color(0.5, 0.5, 0.5)
		leave.modulate = Color.WHITE

func hide_choice():
	$"../HUD/HUD_Layer/Mirror/A".visible = false
	$"../HUD/HUD_Layer/Mirror/B".visible = false
	
func _see():
	choosing = false
	block_choice = true
	block_input = true
	hide_choice()
	$"../HUD/HUD_Layer/Mirror/SEE".visible = true
	$"../HUD/HUD_Layer/Mirror/FadeOut".fade_out()
	await get_tree().create_timer(2.0).timeout
	dialogues = ["It is not a wound. It is the rust of the soul.",
				"The air feels like knifes on this growth.",
				"I don't think I have that much time left before stage two.",
				"And suicide is a luxury I can't afford."]
	if not dialogue_sprite:
		dialogue_sprite = get_tree().get_root().find_child("Dialogue", true, false)
	if showInteractionLabel and dialogue_sprite and dialogue_sprite.currently_playing == -1 and not dialogue_over:
		var hud = get_tree().get_root().find_child("HUD", true, false)
		if hud:
			hud.display_dialogue(self)
	await dialogue_over_wait()
	_leave_see()

func dialogue_over_wait():
	while not dialogue_over:
		await get_tree().process_frame
		%Player.can_move = false
	
func _leave_see():
	$"../HUD/HUD_Layer/Mirror/FadeOut".fade_in()
	await get_tree().create_timer(2.0).timeout
	$"../HUD/HUD_Layer/Mirror/SEE".visible = false
	_leave()

func _leave():
	hide_choice()
	choosing = false
	block_choice = false
	block_input = true
	$"../HUD/HUD_Layer/Mirror/FadeOut".fade_out()
	await get_tree().create_timer(2.0).timeout
	%Player.can_move = true
	dialogues = ["I do not bleed... But everything in me is dying.",
					"I'm scared to look at it."]
	block_input = false
	
	
func _input(event):
	if block_input:
		return
	if not choosing:
		return
	
	if event.is_action_pressed("down"):
		choice_index = 1
		choice_visual()
	
	if event.is_action_pressed("up"):
		choice_index = 0
		choice_visual()
	
	if event.is_action_pressed("continue"):
		if choice_index == 0:
			_see()
		else:
			_leave()
	
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
