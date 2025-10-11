extends CharacterBody2D
class_name Player

@export var SPEED = 25
@export var czas = 0.6
@export var ciemnosc = true
@export var hasLamp = true

var facing = "Down"

var carrying: bool = false

var has_items = 0
var was_surface = 0

func _ready() -> void:
	%Ciemnosc.visible = ciemnosc
	if get_tree().current_scene.scene_file_path == "res://Scenes/Surface.tscn":
		expand_darkness(2)
	has_items = GameState.has_items
	was_surface = GameState.was_surface

func _input(event) -> void:
	if event.is_action_pressed("run"):
		SPEED = SPEED * 2
		czas = czas / 1.33
	if event.is_action_released("run"):
		SPEED = SPEED / 2.0
		czas = czas * 1.33
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit(0)

func _physics_process(_delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
		if $Timer.time_left <=0:
			$walking.pitch_scale = randf_range(0.75, 1.1)
			$walking.play()
			$Timer.start(czas)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
		if $Timer.time_left <=0:
			$walking.pitch_scale = randf_range(0.8, 1.2)
			$walking.play()
			$Timer.start(czas)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	
	if velocity != Vector2.ZERO:
		$AnimationTree.set("parameters/Standing/blend_position", velocity)
		$AnimationTree.set("parameters/Walking/blend_position", velocity)
		
		
	move_and_slide()


func _on_wyjscie_interaction_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	
func expand_darkness(scale: int):
	%Ciemnosc.scale *= scale
	


func _on_mina_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_mirror_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
