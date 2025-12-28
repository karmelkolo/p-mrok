extends Area2D

@onready var audio = $AudioStreamPlayer2D
@onready var player = $"../Player"

const labirynt_ambient = preload("res://Audio/labirynt.mp3")
const surface_ambient = preload("res://Audio/main_ambient.mp3")

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body == player:
		audio.stream = labirynt_ambient
		#audio.stream.loop = true
		audio.play()

func _on_body_exited(body):
	if body == player:
		audio.stream = surface_ambient
		#audio.stream.loop = true
		audio.play()
