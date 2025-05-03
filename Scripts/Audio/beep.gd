extends AudioStreamPlayer2D

@onready var player = get_node("/root/Node2D/Player")
@onready var monster = get_node("/root/Node2D/Monster")
@onready var beep = self

var current_stream : AudioStream

func _ready() -> void:
	beep.stream.loop = true
	beep.play()

func _process(_delta: float) -> void:
	var roznica = (player.position - monster.position).length()
	var new_stream : AudioStream
	if roznica < 100:
		beep.pitch_scale = 1.4
	elif roznica < 200:
		beep.pitch_scale = 1.2
	else:
		beep.pitch_scale = 1
