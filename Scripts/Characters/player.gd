extends CharacterBody2D
class_name Player

@export var SPEED = 25

var facing = "Down"

var carrying: bool = false

func _ready() -> void:
	%Ciemnosc.visible = true

func _input(event) -> void:
	if event.is_action_pressed("run"):
		SPEED = SPEED * 2
	if event.is_action_released("run"):
		SPEED = SPEED / 2.0
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit(0)

func _physics_process(_delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if velocity != Vector2.ZERO:
		$AnimationTree.set("parameters/Standing/blend_position", velocity)
		$AnimationTree.set("parameters/Walking/blend_position", velocity)
		
		
	move_and_slide()
