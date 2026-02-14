extends AudioStreamPlayer2D

@onready var player = get_node("../Player")
@onready var monster = get_node("../Monster")
@onready var beep = self

var current_stream : AudioStream

func _ready() -> void:
	#if get_tree().current_scene.scene_file_path != "res://Scenes/test.tscn":
		#return
	beep.stream.loop = true
	beep.play()
	beep.stop()
func _process(_delta: float) -> void:
	#if get_tree().current_scene.scene_file_path != "res://Scenes/test.tscn":
		#return
	var roznica = 0
	if(monster != null):
		roznica = (player.position - monster.position).length()
		var new_stream : AudioStream
	
	if get_tree().current_scene.scene_file_path != "res://Scenes/menu.tscn":
		if roznica < 120:
			beep.pitch_scale = 1.3
		elif roznica < 480:
			beep.pitch_scale = 1.15
		elif roznica > 700:
			beep.stop()
		else:
			if not beep.is_playing():
				beep.play()
			beep.pitch_scale = 1
	
		
