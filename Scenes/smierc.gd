extends Node2D

@onready var label: RichTextLabel = $CanvasLayer/Intro
@onready var timer: Timer = $CanvasLayer/Intro/Timer
@onready var type_sound: AudioStreamPlayer2D = $Type_Sound

var full_text: String = "GAME OVER"
var current_index: int = 0
var currently_playing = -1

func _ready() -> void:
	label.text = ""
	timer.timeout.connect(_on_timer_timeout)
	visible = true
	timer.wait_time = 0.25
	timer.start()
	currently_playing = 1

func _on_timer_timeout():
	if current_index < full_text.length():
		label.text += full_text[current_index]
		if not type_sound.playing:
			type_sound.play()
		current_index += 1
	else:
		currently_playing = 0
		timer.stop()
		
func _input(event):
	if event.is_action_pressed("continue"):
		if currently_playing == 1:
			label.text = full_text
			current_index = full_text.length()
			currently_playing = 0
			timer.stop()
		elif currently_playing == 0:
			get_tree().change_scene_to_file("res://Scenes/Surface.tscn")
