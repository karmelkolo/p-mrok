extends AudioStreamPlayer2D

@onready var player = get_node("/root/Node2D/Player")
@onready var monster = get_node("/root/Node2D/Monster")
@onready var beep = self

var current_stream : AudioStream

func _ready() -> void:
	if get_tree().current_scene.scene_file_path != "res://Scenes/test.tscn":
		return
	beep.stream.loop = true
	beep.play()

func _process(_delta: float) -> void:
	if get_tree().current_scene.scene_file_path != "res://Scenes/test.tscn":
		return
	var roznica = (player.position - monster.position).length()
	var new_stream : AudioStream
	if roznica < 80:
		beep.pitch_scale = 1.4
	elif roznica < 160:
		beep.pitch_scale = 1.2
	else:
		beep.pitch_scale = 1
