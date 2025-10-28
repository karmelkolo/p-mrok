extends Sprite2D

@onready var label: RichTextLabel = $Intro1
@onready var timer: Timer = $Intro1/Timer
@onready var type_sound: AudioStreamPlayer2D = $Type_Sound

var full_text: String = ""
var current_index: int = 0
var currently_playing = -1

func _ready() -> void:
	label.text = ""
	timer.timeout.connect(_on_timer_timeout)
	visible = false

func start(new_text: String, delay:= 0.0):
	full_text = new_text
	current_index = 0
	label.text = ""
	
	await get_tree().create_timer(delay).timeout
	
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		player.can_move = true
	
	visible = true
	timer.wait_time = 0.04
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
