extends CharacterBody2D


@export var SPEED = 300.0

var facing = "Down"

func _process(_delta: float) -> void:
	if velocity.x != 0 || velocity.y != 0:
		$Player_Sprite.animation = "Walking_" + facing
	else:
		$Player_Sprite.animation = "Standing_" + facing

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
		
	move_and_slide()
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		facing = "Down"
	if event.is_action_pressed("ui_left"):
		facing = "Left"
	if event.is_action_pressed("ui_right"):
		facing = "Right"
	if event.is_action_pressed("ui_up"):
		facing = "Up"
